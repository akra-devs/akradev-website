import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/landing/landing_cubit.dart';
import 'features/landing/landing_state.dart';
import 'shared/theme/app_colors.dart';
import 'shared/utils/responsive.dart' as responsive;
import 'shared/widgets/fade_in_up.dart';
import 'shared/widgets/nav_item.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: baseScheme.copyWith(
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          primary: AppColors.accent,
          onPrimary: Colors.black,
        ),
        textTheme: Typography.whiteMountainView.apply(
          displayColor: AppColors.textPrimary,
          bodyColor: AppColors.textSecondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: BorderSide(color: AppColors.textPrimary.withValues(alpha: 0.2)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            textStyle: const TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.2),
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
        final targetOffset = scrollOffset + position - 80; // 80px offset for navigation

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
      listenWhen: (previous, current) =>
          previous.isContactDialogVisible != current.isContactDialogVisible ||
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
                      if (state.isUrgencyBannerVisible) const SizedBox(height: 48),
                      LandingHero(
                        hero: state.hero,
                        navItems: state.navItems,
                        onProjectInquiry: handleProjectInquiry,
                        onPortfolioRequest: handlePortfolioRequest,
                        onNavItemClick: _scrollToSection,
                      ),
                  const SizedBox(height: 64),
                  CaseStudiesSection(
                    studies: state.caseStudies,
                    onProjectInquiry: handleProjectInquiry,
                  ),
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
                  SpotlightCtaSection(
                    data: state.spotlight,
                    onPrimary: handleProjectInquiry,
                    onSecondary: handlePortfolioRequest,
                  ),
                  const SizedBox(height: 96),
                  FooterSection(
                    key: _contactKey,
                    content: state.footer,
                  ),
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0B1120),
            Color(0xFF111C37),
            Color(0xFF0F172A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 1024;
          final horizontalPadding = responsive.horizontalPadding(constraints.maxWidth);
          return Padding(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 48, horizontalPadding, 96),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LandingNavigation(
                      isDesktop: isDesktop,
                      navItems: navItems,
                      onProjectInquiry: onProjectInquiry,
                      onNavItemClick: onNavItemClick,
                    ),
                    const SizedBox(height: 72),
                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _HeroCopy(
                              hero: hero,
                              onProjectInquiry: onProjectInquiry,
                              onPortfolioRequest: onPortfolioRequest,
                            ),
                          ),
                          const SizedBox(width: 64),
                          Expanded(
                            child: _HeroShowcase(hero: hero),
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
                          const SizedBox(height: 48),
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
    return Row(
      children: [
        Text(
          'akradev studio',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        const Spacer(),
        if (isDesktop)
          Row(
            children: [
              for (final item in navItems)
                NavItem(
                  label: item,
                  onTap: () => onNavItemClick(item),
                ),
              ElevatedButton(
                onPressed: onProjectInquiry,
                child: const Text('무료 상담 신청'),
              ),
            ],
          )
        else
          ElevatedButton.icon(
            onPressed: onProjectInquiry,
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('상담하기'),
          ),
      ],
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
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.4)),
          ),
          child: Text(
            hero.badge,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.accent,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          hero.headline,
          style: theme.textTheme.displaySmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            height: 1.1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          hero.subHeadline,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary.withValues(alpha: 0.82),
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          hero.description,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: onProjectInquiry,
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Text('무료 상담 신청하기'),
            ),
            OutlinedButton.icon(
              onPressed: onPortfolioRequest,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('성공 사례 먼저 보기'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        _MetricsRow(metrics: hero.metrics),
        const SizedBox(height: 32),
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
      children: [
        for (final metric in metrics) _MetricTile(metric: metric),
      ],
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
          Text(
            metric.value,
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
          children: [
            for (final brand in brands)
              _TrustedBadge(label: brand),
          ],
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
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_graph_rounded, color: AppColors.accent.withValues(alpha: 0.9)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '유저 데이터 분석과 제품 로드맵 설계까지 한 번에 제공해요.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
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

class LandingServices extends StatelessWidget {
  const LandingServices({super.key, required this.services});

  final List<ServiceItem> services;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);
          final isWide = width >= 960;
          final double rawAvailable =
              (width - (horizontalPadding * 2)).clamp(0.0, width).toDouble();
          final double contentWidth = math.min(rawAvailable, 1200.0);
          final double cardWidth = isWide ? (contentWidth - 24) / 2 : contentWidth;

          return Padding(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 80, horizontalPadding, 80),
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
                      '제품 전체 라이프사이클을 책임지는 파트너',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    '아이디어 검증, UX/UI 설계, 풀스택 개발, 배포·운영 자동화까지 한 팀으로 움직입니다. '
                    '자체 앱을 만들며 학습한 실행 방식 그대로, 고객사의 미션을 달성하도록 돕습니다.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      for (var i = 0; i < services.length; i++)
                        SizedBox(
                          width: isWide ? cardWidth : double.infinity,
                          child: FadeInUp(
                            delay: Duration(milliseconds: 100 * i),
                            child: _ServiceCard(service: services[i]),
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

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

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
                  const Icon(Icons.check_rounded, color: AppColors.accent, size: 20),
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
          final double cardWidth = isWide ? (contentWidth - 40) / 2 : contentWidth;

          return Padding(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 80, horizontalPadding, 80),
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
              Text(
                study.company,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.trending_up, size: 16, color: AppColors.accent),
                    const SizedBox(width: 6),
                    Text(
                      study.result,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                      const Icon(Icons.check_circle, size: 18, color: AppColors.accent),
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
          final double cardWidth = isWide ? (contentWidth - 36) / 3 : contentWidth;

          return Padding(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 80, horizontalPadding, 80),
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
              child: isWide
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      OutlinedButton(
        onPressed: onSecondary,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
          padding: EdgeInsets.fromLTRB(horizontalPadding, 64, horizontalPadding, 48),
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
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
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
        final isSubmitting = state.formStatus == FormSubmissionStatus.submitting;
        final headline = widget.intent == ContactIntent.portfolio
            ? '포트폴리오 요청'
            : '프로젝트 문의';

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
                      onPressed: isSubmitting ? null : () => Navigator.of(context).pop(),
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
                  onChanged: (value) => cubit.updateFormField(projectDescription: value),
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
                      border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.formErrorMessage!,
                            style: theme.textTheme.bodySmall?.copyWith(color: Colors.red),
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
                      onPressed: isSubmitting ? null : () => Navigator.of(context).pop(),
                      child: const Text('취소'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: isSubmitting
                          ? null
                          : () {
                              cubit.submitLeadForm();
                            },
                      child: isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
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
              Text(
                ' *',
                style: TextStyle(color: AppColors.accent),
              ),
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
            hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5)),
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          value: value,
          onChanged: enabled ? onChanged : null,
          dropdownColor: AppColors.surface,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class UrgencyBanner extends StatelessWidget {
  const UrgencyBanner({super.key, required this.onDismiss});

  final VoidCallback onDismiss;

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
            '이번 주 무료 상담 3자리 남음',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(width: 4),
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
            onPressed: onDismiss,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
