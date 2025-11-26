import 'package:flutter/material.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/utils/responsive.dart' as responsive;
import '../landing_state.dart';

class LandingServices extends StatefulWidget {
  const LandingServices({super.key, required this.services});

  final List<ServiceItem> services;

  @override
  State<LandingServices> createState() => _LandingServicesState();
}

class _LandingServicesState extends State<LandingServices> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);
          final isDesktop = width >= 1024;

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
                      '비즈니스 성공을 위한\n완전한 제품 개발',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '아이디어 검증부터 디자인, 개발, 앱스토어 출시까지 완전한 제품 개발 경험을 제공합니다. '
                      'Flutter로 iOS·Android·Web을 동시에 개발하고, 필요시 백엔드까지 함께 구축합니다.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Bento Grid Layout
                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _BentoCard(
                              service: widget.services[0],
                              isLarge: true,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              children: [
                                _BentoCard(
                                  service: widget.services[1],
                                  isLarge: false,
                                ),
                                const SizedBox(height: 24),
                                _TechStackCard(),
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _BentoCard(
                            service: widget.services[0],
                            isLarge: false,
                          ),
                          const SizedBox(height: 24),
                          _BentoCard(
                            service: widget.services[1],
                            isLarge: false,
                          ),
                          const SizedBox(height: 24),
                          _TechStackCard(),
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

class _BentoCard extends StatefulWidget {
  const _BentoCard({required this.service, required this.isLarge});

  final ServiceItem service;
  final bool isLarge;

  @override
  State<_BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<_BentoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        height: widget.isLarge ? 620 : 380,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1F), // Apple's dark gray
          borderRadius: BorderRadius.circular(32), // Smoother corners
          border: Border.all(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.2)
                : Colors.transparent,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
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
              child: Icon(
                widget.service.icon,
                color: AppColors.accent,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.service.title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.service.subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.service.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            if (widget.isLarge) ...[
              const Spacer(),
              for (final point in widget.service.points)
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
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TechStackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1F),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '핵심 기술 스택',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _TechChip(label: 'Flutter'),
              _TechChip(label: 'Dart'),
              _TechChip(label: 'Firebase'),
              _TechChip(label: 'Supabase'),
              _TechChip(label: 'Cloud Functions'),
            ],
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
