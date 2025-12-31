import 'package:flutter/material.dart';
import '../../../shared/utils/responsive.dart' as responsive;
import '../landing_state.dart';

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
          child: Container(
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
                            child: _SpotlightCopy(
                              theme: theme,
                              data: data,
                              isWide: isWide,
                            ),
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
                          _SpotlightCopy(
                            theme: theme,
                            data: data,
                            isWide: isWide,
                          ),
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
          );
      },
    );
  }
}

class _SpotlightCopy extends StatelessWidget {
  const _SpotlightCopy({
    required this.theme,
    required this.data,
    required this.isWide,
  });

  final ThemeData theme;
  final PrimaryCta data;
  final bool isWide;

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
            fontSize: isWide ? 56 : 32,
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
