import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/theme/app_colors.dart';
import '../widgets/section_layout.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionLayout(
      backgroundColor: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
           final width = MediaQuery.of(context).size.width;
           // The content logic here depends on width.
           // SectionLayout handles padding, but the child might need to know width?
           // Yes, existing logic uses constraints.maxWidth for text scaling sometimes, or mediaquery.
           // The existing code uses `width` variable which comes from constraints.maxWidth.
           // BUT `SectionLayout`'s padding reduces the maxWidth available to the child.
           // If the code logic `width >= 1024` was intended for SCREEN width for font size, using `constraints.maxWidth` INSIDE padding is slightly different (smaller).
           // However, usually font breakpoints are based on screen width.
           // Looking at previous code: `width = constraints.maxWidth`.
           // Responsive padding changes with screen width.
           // If we use SectionLayout, constraints.maxWidth will be (Screen - Padding).
           // If we want font size to react to SCREEN width, we should use MediaQuery.
           
           // I will use MediaQuery for the font sizing logic to be safe and consistent with "responsive" concept generally.
           
           return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '우리의 철학',
                style: GoogleFonts.notoSansKr(
                  color: AppColors.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                '기술의 깊이가\n비즈니스의 높이를 결정합니다',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: width >= 1024 ? 64 : 36,
                  height: 1.2,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accent,
                          AppColors.secondary,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Text(
                      '우리는 코드가 단순한 기능 구현을 넘어, 비즈니스 성장을 견인하는 핵심 자산이라고 믿습니다.\n'
                      '치열한 고민과 정교한 설계를 통해, 시장에서 증명되는\n'
                      '압도적인 디지털 경쟁력을 창조합니다.',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                        fontSize: width >= 1024 ? 24 : 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              _PhilosophyGrid(),
            ],
          );
        }
      ),
    );
  }
}

class _PhilosophyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        return Wrap(
          spacing: 40,
          runSpacing: 40,
          children: [
            _PhilosophyItem(
              icon: Icons.psychology_outlined,
              title: '본질적 통찰',
              description: '현상을 넘어 문제의 본질을\n꿰뚫어 봅니다.',
              isMobile: isMobile,
            ),
            _PhilosophyItem(
              icon: Icons.code,
              title: '견고한 설계',
              description: '지속 가능한 성장을 위한\n단단한 기반을 만듭니다.',
              isMobile: isMobile,
            ),
            _PhilosophyItem(
              icon: Icons.rocket_launch_outlined,
              title: '압도적 실행',
              description: '빠른 실행과 검증으로\n시장을 선점합니다.',
              isMobile: isMobile,
            ),
          ],
        );
      },
    );
  }
}

class _PhilosophyItem extends StatelessWidget {
  const _PhilosophyItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: isMobile ? double.infinity : 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Icon(icon, color: AppColors.accent, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
