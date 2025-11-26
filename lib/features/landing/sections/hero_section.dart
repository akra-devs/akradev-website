import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/utils/responsive.dart' as responsive;
import '../../../shared/widgets/animated_counter.dart';
import '../../../shared/widgets/hover_scale_effect.dart';
import '../landing_state.dart';
import '../widgets/landing_navigation.dart';

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
            HoverScaleEffect(
              child: ElevatedButton.icon(
                onPressed: onProjectInquiry,
                icon: const Icon(Icons.rocket_launch_outlined, size: 20),
                label: const Text('무료 상담 신청하기'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            HoverScaleEffect(
              child: OutlinedButton.icon(
                onPressed: onPortfolioRequest,
                icon: const Icon(Icons.arrow_forward, size: 20),
                label: const Text('성공 사례 먼저 보기'),
                 style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
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
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.white24),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Code Snippet or Abstract Visual
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _CodeDot(color: Colors.red[400]!),
                    const SizedBox(width: 8),
                    _CodeDot(color: Colors.amber[400]!),
                    const SizedBox(width: 8),
                    _CodeDot(color: Colors.green[400]!),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '// We build the future',
                  style: GoogleFonts.firaCode(
                    color: Colors.blueGrey[400],
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'final success = await AkraDev.launch(\n  project: "Your Vision",\n  quality: Quality.premium,\n);',
                  style: GoogleFonts.firaCode(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 13,
                    height: 1.6,
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

class _CodeDot extends StatelessWidget {
  const _CodeDot({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
