import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../shared/theme/app_colors.dart';
import '../widgets/section_layout.dart';
import '../landing_state.dart';

class FounderSection extends StatelessWidget {
  const FounderSection({super.key, required this.profile});

  final FounderProfile profile;

  @override
  Widget build(BuildContext context) {
    return SectionLayout(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B1426), Color(0xFF111F39)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      verticalPadding: 56,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = MediaQuery.of(context).size.width;
          final contentWidth = constraints.maxWidth;
          // Note: Previous code used `constraints.maxWidth` of OUTER container for `rawAvailable`.
          // Here `contentWidth` is already constrained by padding.
          // The previous code had `rawAvailable = width - padding*2`.
          // So `contentWidth` here IS `rawAvailable`.
          final isWide = contentWidth >= 820;

          return isWide
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FounderSummary(
                      profile: profile,
                      isWide: isWide,
                    ),
                  ),
                  const SizedBox(width: 48),
                  Expanded(child: _FounderHighlights(profile: profile)),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FounderSummary(
                    profile: profile,
                    isWide: isWide,
                  ),
                  const SizedBox(height: 32),
                  _FounderHighlights(profile: profile),
                ],
              );
        },
      ),
    );
  }
}

class _FounderSummary extends StatelessWidget {
  const _FounderSummary({required this.profile, required this.isWide});

  final FounderProfile profile;
  final bool isWide;

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
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2A4F),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    color: AppColors.accent,
                  ),
                );
              },
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
            fontSize: isWide ? 40 : 28,
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
              '기술 스택',
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
