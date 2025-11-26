import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/utils/responsive.dart' as responsive;

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              120,
              horizontalPadding,
              120,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PHILOSOPHY',
                      style: GoogleFonts.inter(
                        color: AppColors.accent,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Code is Poetry,\nProduct is Art.',
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
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
                            '우리는 코드가 단순한 기능 구현을 넘어, 미래를 그리는 붓이라고 믿습니다.\n'
                            '단 한 줄의 코드에도 장인 정신을 담아, 사용자의 삶을 변화시키는\n'
                            '가치 있는 디지털 경험을 창조합니다.',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w400,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    _PhilosophyGrid(),
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
              title: 'Deep Thinking',
              description: '본질을 꿰뚫는 통찰력으로\n문제의 핵심을 해결합니다.',
              isMobile: isMobile,
            ),
            _PhilosophyItem(
              icon: Icons.code,
              title: 'Clean Code',
              description: '유지보수 가능한 견고한\n아키텍처를 설계합니다.',
              isMobile: isMobile,
            ),
            _PhilosophyItem(
              icon: Icons.rocket_launch_outlined,
              title: 'Fast Execution',
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
