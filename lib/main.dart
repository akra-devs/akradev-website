import 'dart:async';
import 'dart:math' as math;
import 'dart:ui'; // For ImageFilter

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/landing/landing_cubit.dart';
import 'features/landing/landing_state.dart';
import 'shared/theme/app_colors.dart';
import 'shared/utils/responsive.dart' as responsive;
import 'shared/widgets/animated_counter.dart';
import 'shared/widgets/fade_in_up.dart';
import 'shared/widgets/nav_item.dart';

void main() {
  runApp(const MyApp());
}

// Custom ScrollBehavior to enable drag scrolling on web/desktop
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseScheme = ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'akradev studio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: baseScheme.copyWith(
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          primary: AppColors.accent,
          onPrimary: Colors.black,
          secondary: const Color(0xFF6366F1), // Indigo accent
        ),
        textTheme: GoogleFonts.notoSansKrTextTheme(
          Typography.whiteMountainView,
        ).apply(
          displayColor: AppColors.textPrimary,
          bodyColor: AppColors.textSecondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            textStyle: GoogleFonts.notoSansKr(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.0,
              fontSize: 16,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: BorderSide(
              color: AppColors.textPrimary.withValues(alpha: 0.2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: GoogleFonts.notoSansKr(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              fontSize: 16,
            ),
          ),
        ),
      ),
      home: BlocProvider(
        create: (_) => LandingCubit(),
        child: const LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _founderKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionName) {
    GlobalKey? targetKey;
    switch (sectionName) {
      case '만드는 사람':
        targetKey = _founderKey;
        break;
      case '서비스':
        targetKey = _servicesKey;
        break;
      case '프로세스':
        targetKey = _processKey;
        break;
      case '연락처':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      final context = targetKey!.currentContext!;
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero).dy;
        final scrollOffset = _scrollController.offset;
        final targetOffset =
            scrollOffset + position - 80; // 80px offset for navigation

        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingCubit, LandingState>(
      listenWhen:
          (previous, current) =>
              previous.isContactDialogVisible !=
                  current.isContactDialogVisible ||
              previous.contactIntent != current.contactIntent,
      listener: (context, state) async {
        if (state.isContactDialogVisible) {
          await _showContactDialog(context, state);
          if (context.mounted) {
            context.read<LandingCubit>().dismissContactDialog();
          }
        }
      },
      child: BlocBuilder<LandingCubit, LandingState>(
        builder: (context, state) {
          final cubit = context.read<LandingCubit>();
          void handleProjectInquiry() => cubit.requestProjectInquiry();
          void handlePortfolioRequest() => cubit.requestPortfolio();

          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state.isUrgencyBannerVisible)
                        const SizedBox(height: 48),
                      LandingHero(
                        hero: state.hero,
                        navItems: state.navItems,
                        onProjectInquiry: handleProjectInquiry,
                        onPortfolioRequest: handlePortfolioRequest,
                        onNavItemClick: _scrollToSection,
                      ),
                      const SizedBox(height: 64),
                      FounderSection(
                        key: _founderKey,
                        profile: state.founder,
                      ),
                      const SizedBox(height: 96),
                      CaseStudiesSection(
                        studies: state.caseStudies,
                        onProjectInquiry: handleProjectInquiry,
                      ),
                      const SizedBox(height: 96),
                      ProjectGallerySection(projects: state.galleryProjects),
                      const SizedBox(height: 96),
                      ProcessSection(
                        key: _processKey,
                        steps: state.processSteps,
                      ),
                      const SizedBox(height: 96),
                      LandingServices(
                        key: _servicesKey,
                        services: state.services,
                      ),
                      const SizedBox(height: 96),
                      ReviewSection(reviews: state.reviews),
                      const SizedBox(height: 96),
                      SpotlightCtaSection(
                        data: state.spotlight,
                        onPrimary: handleProjectInquiry,
                        onSecondary: handlePortfolioRequest,
                      ),
                      const SizedBox(height: 96),
                      FooterSection(key: _contactKey, content: state.footer),
                    ],
                  ),
                ),
                if (state.isUrgencyBannerVisible)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: UrgencyBanner(
                      onDismiss: () => cubit.dismissUrgencyBanner(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LandingHero extends StatelessWidget {
  const LandingHero({
    super.key,
    required this.hero,
    required this.navItems,
    required this.onProjectInquiry,
    required this.onPortfolioRequest,
    required this.onNavItemClick,
  });

  final HeroSection hero;
  final List<String> navItems;
  final VoidCallback onProjectInquiry;
  final VoidCallback onPortfolioRequest;
  final void Function(String) onNavItemClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Ambient Background Effects
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF38BDF8).withValues(alpha: 0.15),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.7],
              ),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: -200,
          child: Container(
            width: 800,
            height: 800,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6366F1).withValues(alpha: 0.1),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.7],
              ),
            ),
          ),
        ),
        
        // Main Content
        Container(
          // subtle grid pattern could go here
          decoration: const BoxDecoration(
             // Keep the base dark gradient but lighter
            gradient: LinearGradient(
              colors: [Color(0xFF0B1120), Color(0xFF0F172A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 1024;
              final horizontalPadding = responsive.horizontalPadding(
                constraints.maxWidth,
              );
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  32, // Reduced top padding for a tighter feel
                  horizontalPadding,
                  96,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1280),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LandingNavigation(
                          isDesktop: isDesktop,
                          navItems: navItems,
                          onProjectInquiry: onProjectInquiry,
                          onNavItemClick: onNavItemClick,
                        ),
                        const SizedBox(height: 80),
                        if (isDesktop)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // Align center for better balance
                            children: [
                              Expanded(
                                flex: 5,
                                child: _HeroCopy(
                                  hero: hero,
                                  onProjectInquiry: onProjectInquiry,
                                  onPortfolioRequest: onPortfolioRequest,
                                ),
                              ),
                              const SizedBox(width: 80),
                              Expanded(
                                flex: 6,
                                child: _HeroShowcase(hero: hero)
                              ),
                            ],
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _HeroCopy(
                                hero: hero,
                                onProjectInquiry: onProjectInquiry,
                                onPortfolioRequest: onPortfolioRequest,
                              ),
                              const SizedBox(height: 64),
                              _HeroShowcase(hero: hero),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LandingNavigation extends StatelessWidget {
  const LandingNavigation({
    super.key,
    required this.isDesktop,
    required this.navItems,
    required this.onProjectInquiry,
    required this.onNavItemClick,
  });

  final bool isDesktop;
  final List<String> navItems;
  final VoidCallback onProjectInquiry;
  final void Function(String) onNavItemClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(100), // Pill shape
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Logo / Brand
              Icon(Icons.code, color: AppColors.accent, size: 24),
              const SizedBox(width: 12),
              Text(
                'akradev studio',
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const Spacer(),
              if (isDesktop)
                Row(
                  children: [
                    for (final item in navItems)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: NavItem(
                          label: item, 
                          onTap: () => onNavItemClick(item)
                        ),
                      ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: onProjectInquiry,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                         textStyle: GoogleFonts.notoSansKr(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      child: const Text('무료 상담 신청'),
                    ),
                  ],
                )
              else
                IconButton(
                   onPressed: onProjectInquiry,
                   icon: const Icon(Icons.menu, color: Colors.white),
                ), 
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.hero,
    required this.onProjectInquiry,
    required this.onPortfolioRequest,
  });

  final HeroSection hero;
  final VoidCallback onProjectInquiry;
  final VoidCallback onPortfolioRequest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
          ),
          child: Text(
            hero.badge,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.accent,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFF94A3B8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: Text(
            hero.headline,
            style: theme.textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -1.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          hero.subHeadline,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: const Color(0xFF94A3B8), // Slate-400
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          hero.description,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.8,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: onProjectInquiry,
              icon: const Icon(Icons.rocket_launch_outlined, size: 20),
              label: const Text('무료 상담 신청하기'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onPortfolioRequest,
              icon: const Icon(Icons.arrow_forward, size: 20),
              label: const Text('성공 사례 먼저 보기'),
               style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        _MetricsRow(metrics: hero.metrics),
        const SizedBox(height: 40),
        _TrustedByRow(brands: hero.trustedBy),
      ],
    );
  }
}

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({required this.metrics});

  final List<MetricInfo> metrics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 28,
      runSpacing: 28,
      children: [for (final metric in metrics) _MetricTile(metric: metric)],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});

  final MetricInfo metric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCounter(
            value: metric.value,
            label: metric.label,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            metric.label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrustedByRow extends StatelessWidget {
  const _TrustedByRow({required this.brands});

  final List<String> brands;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '함께 성장한 팀',
          style: theme.textTheme.labelMedium?.copyWith(
            color: AppColors.textSecondary,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [for (final brand in brands) _TrustedBadge(label: brand)],
        ),
      ],
    );
  }
}

class _TrustedBadge extends StatelessWidget {
  const _TrustedBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textPrimary.withValues(alpha: 0.85),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

class _HeroShowcase extends StatelessWidget {
  const _HeroShowcase({required this.hero});

  final HeroSection hero;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 40,
            offset: const Offset(0, 24),
            spreadRadius: -12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hero.heroImageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                hero.heroImageUrl!,
                // TODO(branding): Replace with final hero visual.
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2A4F),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Recent launches',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          for (final item in hero.showcaseItems) ...[
            _ShowcaseCard(item: item),
            const SizedBox(height: 20),
          ],
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.accent.withValues(alpha: 0.12),
                  AppColors.accent.withValues(alpha: 0.06),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.auto_graph_rounded,
                  color: AppColors.accent,
                  size: 28,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '아이디어 검증 → 디자인 → 개발 → 앱스토어 출시까지 완전한 제품 개발 프로세스를 제공합니다.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseCard extends StatelessWidget {
  const _ShowcaseCard({required this.item});

  final ShowcaseItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1D2956), Color(0xFF17203A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class FounderSection extends StatelessWidget {
  const FounderSection({super.key, required this.profile});

  final FounderProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B1426), Color(0xFF111F39)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);
          final double rawAvailable =
              (width - (horizontalPadding * 2)).clamp(0.0, width).toDouble();
          final double contentWidth = math.min(rawAvailable, 1100.0);
          final isWide = contentWidth >= 820;

          final content =
              isWide
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _FounderSummary(profile: profile)),
                      const SizedBox(width: 48),
                      Expanded(child: _FounderHighlights(profile: profile)),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FounderSummary(profile: profile),
                      const SizedBox(height: 32),
                      _FounderHighlights(profile: profile),
                    ],
                  );

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              56,
              horizontalPadding,
              56,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: content,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FounderSummary extends StatelessWidget {
  const _FounderSummary({required this.profile});

  final FounderProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (profile.profileImageUrl != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              profile.profileImageUrl!,
              // TODO(branding): Swap to final profile photo.
              width: 220,
              height: 220,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2A4F),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white.withValues(alpha: 0.65),
                    size: 64,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
        Text(
          '만드는 사람',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.accent,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          profile.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          profile.role,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.accent.withValues(alpha: 0.9),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          profile.bio,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.82),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _FounderHighlights extends StatelessWidget {
  const _FounderHighlights({required this.profile});

  final FounderProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 36,
            offset: const Offset(0, 18),
            spreadRadius: -12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '핵심 역량',
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 18),
          if (profile.highlights.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final highlight in profile.highlights)
                  _FounderHighlightRow(text: highlight),
              ],
            ),
          if (profile.techStacks.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              'Tech Stack',
              style: theme.textTheme.labelMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final stack in profile.techStacks) _TechChip(label: stack),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _FounderHighlightRow extends StatelessWidget {
  const _FounderHighlightRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: AppColors.accent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.82),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.code_rounded, size: 14, color: AppColors.accent),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class LandingServices extends StatefulWidget {
  const LandingServices({super.key, required this.services});

  final List<ServiceItem> services;

  @override
  State<LandingServices> createState() => _LandingServicesState();
}

class _LandingServicesState extends State<LandingServices> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              80,
              horizontalPadding,
              80,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '서비스',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.accent,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '완전한 제품을 만드는 Flutter Product Studio',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '아이디어 검증부터 디자인, 개발, 앱스토어 출시까지 완전한 제품 개발 경험을 제공합니다. '
                      'Flutter로 iOS·Android·Web을 동시에 개발하고, 필요시 백엔드까지 함께 구축합니다.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // 탭 네비게이션
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var i = 0; i < widget.services.length; i++)
                              _ServiceTab(
                                label: widget.services[i].title,
                                isSelected: _selectedIndex == i,
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = i;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // 선택된 서비스 카드
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: _ServiceCard(
                        key: ValueKey(_selectedIndex),
                        service: widget.services[_selectedIndex],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ServiceTab extends StatelessWidget {
  const _ServiceTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black87 : Colors.black54,
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({super.key, required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(service.icon, color: AppColors.accent, size: 28),
          ),
          const SizedBox(height: 24),
          Text(
            service.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            service.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),
          for (final point in service.points)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_rounded,
                    color: AppColors.accent,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CaseStudiesSection extends StatelessWidget {
  const CaseStudiesSection({
    super.key,
    required this.studies,
    required this.onProjectInquiry,
  });

  final List<CaseStudy> studies;
  final VoidCallback onProjectInquiry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B1228), Color(0xFF0F1E36), Color(0xFF101B2F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);
          final double rawAvailable =
              (width - (horizontalPadding * 2)).clamp(0.0, width).toDouble();
          final double contentWidth = math.min(rawAvailable, 1200.0);
          final isWide = contentWidth >= 900;
          final double cardWidth =
              isWide ? (contentWidth - 40) / 2 : contentWidth;

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              80,
              horizontalPadding,
              80,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '프로젝트 스토리',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.accent,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '실제 파트너와 함께 만들어낸 성과를 확인해 보세요.',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      '아이디어 검증부터 운영 고도화까지, akradev studio가 어떤 방식으로 문제를 풀어냈는지 스냅샷으로 담았습니다.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        for (var i = 0; i < studies.length; i++)
                          SizedBox(
                            width: cardWidth,
                            child: FadeInUp(
                              delay: Duration(milliseconds: 100 * i),
                              child: _CaseStudyCard(study: studies[i]),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: onProjectInquiry,
                      icon: const Icon(Icons.calendar_today_outlined),
                      label: const Text('프로젝트 미팅 잡기'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  const _CaseStudyCard({required this.study});

  final CaseStudy study;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF1B2A4F), Color(0xFF141F39)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 18),
            spreadRadius: -12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  study.company,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.trending_up,
                        size: 16,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          study.result,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            study.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            study.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final highlight in study.highlights)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          highlight,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (study.detailedMetrics != null) ...[
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '핵심 성과 지표',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _MetricChip(
                        label: '다운로드',
                        value: study.detailedMetrics!.downloads,
                        icon: Icons.download,
                      ),
                      _MetricChip(
                        label: '리텐션',
                        value: study.detailedMetrics!.retention,
                        icon: Icons.repeat,
                      ),
                      _MetricChip(
                        label: '수익/효과',
                        value: study.detailedMetrics!.revenue,
                        icon: Icons.trending_up,
                      ),
                      _MetricChip(
                        label: '전환율',
                        value: study.detailedMetrics!.conversionRate,
                        icon: Icons.auto_graph,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.accent),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key, required this.steps});

  final List<ProcessStep> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);
          final double rawAvailable =
              (width - (horizontalPadding * 2)).clamp(0.0, width).toDouble();
          final double contentWidth = math.min(rawAvailable, 1200.0);
          final isWide = contentWidth >= 900;
          final double cardWidth =
              isWide ? (contentWidth - 36) / 3 : contentWidth;

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              80,
              horizontalPadding,
              80,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '프로세스',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.accent,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '아이디어에서 운영까지, 집중력 있게 완주합니다',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      '각 단계별로 필요한 팀과 실행 항목을 정리해 두어 빠르게 착수하고, 데이터를 기반으로 다음 단계를 설계합니다.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 18,
                      runSpacing: 18,
                      children: [
                        for (var i = 0; i < steps.length; i++)
                          SizedBox(
                            width: isWide ? cardWidth : double.infinity,
                            child: FadeInUp(
                              delay: Duration(milliseconds: 100 * i),
                              child: _ProcessCard(step: steps[i]),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProcessCard extends StatelessWidget {
  const _ProcessCard({required this.step});

  final ProcessStep step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    step.order.toString().padLeft(2, '0'),
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                step.duration,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            step.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            step.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class SpotlightCtaSection extends StatelessWidget {
  const SpotlightCtaSection({
    super.key,
    required this.data,
    required this.onPrimary,
    required this.onSecondary,
  });

  final PrimaryCta data;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontalPadding = responsive.horizontalPadding(width);
        final isWide = width >= 900;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 52),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0EA5E9), Color(0xFF6366F1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 40,
                    offset: const Offset(0, 22),
                    spreadRadius: -18,
                  ),
                ],
              ),
              child:
                  isWide
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _SpotlightCopy(theme: theme, data: data),
                          ),
                          const SizedBox(width: 40),
                          _SpotlightActions(
                            onPrimary: onPrimary,
                            onSecondary: onSecondary,
                            primaryLabel: data.primaryLabel,
                            secondaryLabel: data.secondaryLabel,
                          ),
                        ],
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SpotlightCopy(theme: theme, data: data),
                          const SizedBox(height: 32),
                          _SpotlightActions(
                            onPrimary: onPrimary,
                            onSecondary: onSecondary,
                            primaryLabel: data.primaryLabel,
                            secondaryLabel: data.secondaryLabel,
                            isHorizontal: false,
                          ),
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }
}

class _SpotlightCopy extends StatelessWidget {
  const _SpotlightCopy({required this.theme, required this.data});

  final ThemeData theme;
  final PrimaryCta data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.eyebrow,
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
            letterSpacing: 0.6,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.headline,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          data.body,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.86),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _SpotlightActions extends StatelessWidget {
  const _SpotlightActions({
    required this.onPrimary,
    required this.onSecondary,
    required this.primaryLabel,
    required this.secondaryLabel,
    this.isHorizontal = true,
  });

  final VoidCallback onPrimary;
  final VoidCallback onSecondary;
  final String primaryLabel;
  final String secondaryLabel;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final children = [
      ElevatedButton.icon(
        onPressed: onPrimary,
        icon: const Icon(Icons.rocket_launch_outlined),
        label: Text(primaryLabel),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      OutlinedButton(
        onPressed: onSecondary,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(secondaryLabel),
      ),
    ];

    if (isHorizontal) {
      return Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.end,
        children: children,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final child in children) ...[
          child,
          if (child != children.last) const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required this.content});

  final FooterContent content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontalPadding = responsive.horizontalPadding(width);
        final isDesktop = width >= 960;
        return Container(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            64,
            horizontalPadding,
            48,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.5),
            border: Border(
              top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
            ),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child:
                  isDesktop
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  content.headline,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  content.body,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 48),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              for (final contact in content.contacts) ...[
                                _FooterLink(contact: contact),
                                if (contact != content.contacts.last)
                                  const SizedBox(height: 8),
                              ],
                            ],
                          ),
                        ],
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.headline,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            content.body,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 28),
                          for (final contact in content.contacts) ...[
                            _FooterLink(contact: contact),
                            if (contact != content.contacts.last)
                              const SizedBox(height: 8),
                          ],
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.contact});

  final ContactInfo contact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(contact.icon, color: AppColors.accent, size: 20),
        const SizedBox(width: 12),
        Text(
          contact.label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

Future<void> _showContactDialog(BuildContext context, LandingState state) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: context.read<LandingCubit>(),
        child: Dialog(
          backgroundColor: AppColors.surface,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _LeadFormDialog(
              intent: state.contactIntent ?? ContactIntent.projectInquiry,
            ),
          ),
        ),
      );
    },
  );
}

class _LeadFormDialog extends StatefulWidget {
  const _LeadFormDialog({required this.intent});

  final ContactIntent intent;

  @override
  State<_LeadFormDialog> createState() => _LeadFormDialogState();
}

class _LeadFormDialogState extends State<_LeadFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedBudget;
  String? _selectedTimeline;

  final List<String> _budgetOptions = [
    '1천만원 미만',
    '1천만원 ~ 3천만원',
    '3천만원 ~ 5천만원',
    '5천만원 ~ 1억원',
    '1억원 이상',
    '협의 필요',
  ];

  final List<String> _timelineOptions = [
    '가능한 빠르게',
    '1개월 이내',
    '1~3개월',
    '3~6개월',
    '6개월 이상',
    '유동적',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<LandingCubit>();

    return BlocConsumer<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state.formStatus == FormSubmissionStatus.success) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('문의가 성공적으로 접수되었습니다. 빠른 시일 내에 연락드리겠습니다.'),
              backgroundColor: AppColors.accent,
            ),
          );
        }
      },
      builder: (context, state) {
        final isSubmitting =
            state.formStatus == FormSubmissionStatus.submitting;
        final headline =
            widget.intent == ContactIntent.portfolio ? '포트폴리오 요청' : '프로젝트 문의';

        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        headline,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '아래 정보를 입력해주시면 빠르게 연락드리겠습니다.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  controller: _nameController,
                  label: '이름',
                  hint: '홍길동',
                  isRequired: true,
                  enabled: !isSubmitting,
                  onChanged: (value) => cubit.updateFormField(name: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: '이메일',
                  hint: 'example@company.com',
                  isRequired: true,
                  enabled: !isSubmitting,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => cubit.updateFormField(email: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _companyController,
                  label: '회사명',
                  hint: '(선택) 소속 회사나 팀',
                  enabled: !isSubmitting,
                  onChanged: (value) => cubit.updateFormField(company: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _descriptionController,
                  label: '프로젝트 설명',
                  hint: '어떤 제품을 만들고 싶으신가요? 간단히 설명해주세요.',
                  isRequired: true,
                  enabled: !isSubmitting,
                  maxLines: 4,
                  onChanged:
                      (value) =>
                          cubit.updateFormField(projectDescription: value),
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: '예상 예산',
                  value: _selectedBudget,
                  items: _budgetOptions,
                  enabled: !isSubmitting,
                  onChanged: (value) {
                    setState(() => _selectedBudget = value);
                    cubit.updateFormField(budget: value);
                  },
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: '희망 시작 시기',
                  value: _selectedTimeline,
                  items: _timelineOptions,
                  enabled: !isSubmitting,
                  onChanged: (value) {
                    setState(() => _selectedTimeline = value);
                    cubit.updateFormField(timeline: value);
                  },
                ),
                if (state.formErrorMessage != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.formErrorMessage!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () => Navigator.of(context).pop(),
                      child: const Text('취소'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () {
                                cubit.submitLeadForm();
                              },
                      child:
                          isSubmitting
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text('제출하기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isRequired = false,
    bool enabled = true,
    int maxLines = 1,
    TextInputType? keyboardType,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isRequired)
              Text(' *', style: TextStyle(color: AppColors.accent)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required bool enabled,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          // ignore: deprecated_member_use
          value: value,
          onChanged: enabled ? onChanged : null,
          dropdownColor: AppColors.surface,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items:
              items.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
        ),
      ],
    );
  }
}

class UrgencyBanner extends StatefulWidget {
  const UrgencyBanner({super.key, required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  State<UrgencyBanner> createState() => _UrgencyBannerState();
}

class _UrgencyBannerState extends State<UrgencyBanner> {
  late Timer _timer;
  late DateTime _deadline;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    // 7일 후를 마감 시간으로 설정
    _deadline = DateTime.now().add(const Duration(days: 7));
    _updateRemaining();

    // 매초 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateRemaining();
      }
    });
  }

  void _updateRemaining() {
    setState(() {
      _remaining = _deadline.difference(DateTime.now());
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatRemaining() {
    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;

    if (days > 0) {
      return '$days일 $hours시간 $minutes분 남음';
    } else if (hours > 0) {
      return '$hours시간 $minutes분 $seconds초 남음';
    } else {
      return '$minutes분 $seconds초 남음';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFC1C49), Color(0xFFFF6B6B)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          const Text(
            '이번 주 무료 상담 마감까지',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              _formatRemaining(),
              style: const TextStyle(
                color: Color(0xFFFC1C49),
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '서둘러 신청하세요!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 20),
            onPressed: widget.onDismiss,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

class ProjectGallerySection extends StatefulWidget {
  const ProjectGallerySection({super.key, required this.projects});

  final List<ProjectGalleryItem> projects;

  @override
  State<ProjectGallerySection> createState() => _ProjectGallerySectionState();
}

class _ProjectGallerySectionState extends State<ProjectGallerySection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getCategoryLabel(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.all:
        return '전체';
      case ProjectCategory.healthcare:
        return '헬스케어';
      case ProjectCategory.b2b:
        return 'B2B';
      case ProjectCategory.edtech:
        return 'EdTech';
      case ProjectCategory.entertainment:
        return '엔터테인먼트';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        final cubit = context.read<LandingCubit>();

        // Filter projects based on selected category
        final filteredProjects =
            state.selectedProjectCategory == ProjectCategory.all
                ? widget.projects
                : widget.projects
                    .where(
                      (p) => p.categoryType == state.selectedProjectCategory,
                    )
                    .toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final horizontalPadding = responsive.horizontalPadding(width);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '프로젝트 갤러리',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.accent,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '다양한 산업에서 수익 내는 앱 사례를 확인하세요',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Flutter로 구축한 다양한 산업군의 모바일 앱 포트폴리오입니다. 아이디어 검증부터 디자인, 개발, 앱스토어 출시까지 전 과정을 직접 리드했습니다.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Filter Buttons
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children:
                              ProjectCategory.values.map((category) {
                                final isSelected =
                                    state.selectedProjectCategory == category;
                                return _FilterChip(
                                  label: _getCategoryLabel(category),
                                  isSelected: isSelected,
                                  onTap:
                                      () =>
                                          cubit.selectProjectCategory(category),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 420,
                  child:
                      filteredProjects.isEmpty
                          ? Center(
                            child: Text(
                              '해당 카테고리의 프로젝트가 없습니다',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          )
                          : Scrollbar(
                            controller: _scrollController,
                            thumbVisibility: true,
                            thickness: 4,
                            radius: const Radius.circular(8),
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              itemCount: filteredProjects.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        index < filteredProjects.length - 1
                                            ? 24
                                            : 0,
                                  ),
                                  child: _ProjectCard(
                                    project: filteredProjects[index],
                                  ),
                                );
                              },
                            ),
                          ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.accent
                  : AppColors.surface.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color:
                isSelected
                    ? AppColors.accent
                    : Colors.white.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectGalleryItem project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  void _handleHover(bool hovered) {
    if (_isHovered == hovered) return;
    setState(() => _isHovered = hovered);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: 320,
        transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.45 : 0.22),
              blurRadius: _isHovered ? 44 : 24,
              offset: Offset(0, _isHovered ? 18 : 12),
              spreadRadius: _isHovered ? -6 : -12,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildProjectImage(project),
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:
                          _isHovered
                              ? [
                                Colors.black.withValues(alpha: 0.08),
                                Colors.black.withValues(alpha: 0.85),
                              ]
                              : [
                                Colors.black.withValues(alpha: 0.0),
                                Colors.black.withValues(alpha: 0.78),
                              ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x00121A2F), Color(0xCC121A2F)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AnimatedCrossFade(
                    alignment: Alignment.topLeft,
                    firstChild: _buildDefaultContent(theme, project),
                    secondChild: _buildHoverContent(theme, project),
                    crossFadeState:
                        _isHovered
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 240),
                    sizeCurve: Curves.easeOut,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(ProjectGalleryItem project) {
    final targetUrl =
        _isHovered && project.hoverImageUrl != null
            ? project.hoverImageUrl!
            : project.imageUrl;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,
      child: Container(
        key: ValueKey<String>('${project.name}-$targetUrl-$_isHovered'),
        child: Image.network(
          targetUrl,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF1B2A4F),
              alignment: Alignment.center,
              child: Icon(
                Icons.broken_image_outlined,
                size: 48,
                color: Colors.white.withValues(alpha: 0.4),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDefaultContent(ThemeData theme, ProjectGalleryItem project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryChip(theme, project.category),
        const SizedBox(height: 12),
        Text(
          project.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildHoverContent(ThemeData theme, ProjectGalleryItem project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryChip(theme, project.category),
        const SizedBox(height: 12),
        Text(
          project.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.85),
            height: 1.5,
          ),
        ),
        if (project.hoverHighlights.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                project.hoverHighlights
                    .map((highlight) => _buildHighlightChip(theme, highlight))
                    .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildCategoryChip(ThemeData theme, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.accent,
          fontWeight: FontWeight.w600,
          fontSize: 11,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildHighlightChip(ThemeData theme, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_rounded, size: 14, color: AppColors.accent),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.88),
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoDemoSection extends StatelessWidget {
  const VideoDemoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontalPadding = responsive.horizontalPadding(width);
        final isDesktop = width >= 1024;

        return Container(
          color: AppColors.surface.withValues(alpha: 0.3),
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            80,
            horizontalPadding,
            80,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '작업 과정',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.accent,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'API 백엔드 구축 과정을 확인하세요',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    '도메인 스토리 정리, API 명세 작성, Spring Boot · Flutter 구현, 모니터링까지 백엔드 파이프라인을 어떻게 구축하는지 공유합니다.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (isDesktop)
                    Row(
                      children: [
                        Expanded(
                          child: _VideoCard(
                            title: '도메인 스토리 워크숍',
                            duration: '3:24',
                            description: '이벤트 스토밍으로 데이터 흐름과 컨텍스트를 정리합니다.',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _VideoCard(
                            title: 'API Blueprint & 테스트',
                            duration: '4:58',
                            description: 'Swagger/AsyncAPI 명세와 Spring Boot 통합 테스트 작성 흐름',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _VideoCard(
                            title: '런칭 후 모니터링',
                            duration: '2:45',
                            description: 'Grafana·Slack 알림으로 SLA를 지키는 운영 노하우',
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        _VideoCard(
                          title: '도메인 스토리 워크숍',
                          duration: '3:24',
                          description: '이벤트 스토밍으로 데이터 흐름과 컨텍스트를 정리합니다.',
                        ),
                        const SizedBox(height: 24),
                        _VideoCard(
                          title: 'API Blueprint & 테스트',
                          duration: '4:58',
                          description: 'Swagger/AsyncAPI 명세와 Spring Boot 통합 테스트 작성 흐름',
                        ),
                        const SizedBox(height: 24),
                        _VideoCard(
                          title: '런칭 후 모니터링',
                          duration: '2:45',
                          description: 'Grafana·Slack 알림으로 SLA를 지키는 운영 노하우',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _VideoCard extends StatefulWidget {
  const _VideoCard({
    required this.title,
    required this.duration,
    required this.description,
  });

  final String title;
  final String duration;
  final String description;

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.3 : 0.15),
              blurRadius: _isHovered ? 24 : 16,
              offset: Offset(0, _isHovered ? 12 : 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1B2A4F), Color(0xFF141F39)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.accent.withValues(alpha: 0.2),
                              AppColors.accent.withValues(alpha: 0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.4),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.duration,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.reviews});

  final List<ReviewItem> reviews;

  double get averageRating {
    if (reviews.isEmpty) return 0.0;
    final sum = reviews.fold<double>(0.0, (acc, review) => acc + review.rating);
    return sum / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final horizontalPadding = responsive.horizontalPadding(width);
        final double rawAvailable =
            (width - (horizontalPadding * 2)).clamp(0.0, width).toDouble();
        final double contentWidth = math.min(rawAvailable, 1200.0);
        final isWide = contentWidth >= 900;
        final isMedium = contentWidth >= 600;

        return Container(
          color: const Color(0xFF070B14),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              80,
              horizontalPadding,
              80,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '클라이언트 리뷰',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: AppColors.accent,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '함께 제품을 만든 파트너들의 평가',
                                style: theme.textTheme.displaySmall?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.accent.withValues(alpha: 0.15),
                                AppColors.accent.withValues(alpha: 0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.accent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    averageRating.toStringAsFixed(1),
                                    style: theme.textTheme.displayMedium
                                        ?.copyWith(
                                          color: AppColors.accent,
                                          fontWeight: FontWeight.w800,
                                          height: 1.0,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.accent,
                                    size: 28,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${reviews.length}개 리뷰',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children:
                          reviews.map((review) {
                            final cardWidth =
                                isWide
                                    ? (contentWidth - 48) / 3
                                    : isMedium
                                    ? (contentWidth - 24) / 2
                                    : contentWidth;
                            return SizedBox(
                              width: cardWidth,
                              child: _ReviewCard(review: review),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ReviewItem review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF0D1421),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accent.withValues(alpha: 0.6),
                      AppColors.accent.withValues(alpha: 0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    review.clientName[0],
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.clientName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${review.clientRole} · ${review.clientCompany}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _StarRating(rating: review.rating),
          const SizedBox(height: 16),
          Text(
            review.review,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              review.projectType,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  const _StarRating({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFullStar = index < rating.floor();
        final isHalfStar = index < rating && index >= rating.floor();

        return Icon(
          isFullStar
              ? Icons.star
              : isHalfStar
              ? Icons.star_half
              : Icons.star_border,
          color: AppColors.accent,
          size: 18,
        );
      }),
    );
  }
}
