import 'package:flutter/material.dart';

class HoverScaleEffect extends StatefulWidget {
  const HoverScaleEffect({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final double scale;
  final Duration duration;

  @override
  State<HoverScaleEffect> createState() => _HoverScaleEffectState();
}

class _HoverScaleEffectState extends State<HoverScaleEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}
