import 'package:flutter/material.dart';
import '../../../shared/utils/responsive.dart' as responsive;

class SectionLayout extends StatelessWidget {
  const SectionLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.decoration,
    this.verticalPadding = 120.0,
    this.topPadding,
    this.bottomPadding,
  });

  final Widget child;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final double verticalPadding;
  final double? topPadding;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: decoration == null ? backgroundColor : null,
      decoration: decoration,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = responsive.horizontalPadding(width);

          return Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              topPadding ?? verticalPadding,
              horizontalPadding,
              bottomPadding ?? verticalPadding,
            ),
            child: child,
          );
        },
      ),
    );
  }
}
