import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({
    super.key,
    required this.value,
    required this.label,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeOutCubic,
    this.style,
  });

  final String value;
  final String label;
  final Duration duration;
  final Curve curve;
  final TextStyle? style;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int? _targetNumber;
  String? _suffix;

  @override
  void initState() {
    super.initState();

    // Parse the value to extract number and suffix
    _parseValue();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: _targetNumber?.toDouble() ?? 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Start animation after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  void _parseValue() {
    final value = widget.value;

    if (value.endsWith('%')) {
      _targetNumber = int.tryParse(value.replaceAll('%', ''));
      _suffix = '%';
    } else if (value.endsWith('+')) {
      _targetNumber = int.tryParse(value.replaceAll('+', ''));
      _suffix = '+';
    } else if (value.contains('개월')) {
      _targetNumber = int.tryParse(value.replaceAll('개월', ''));
      _suffix = '개월';
    } else if (value.contains('년')) {
      _targetNumber = int.tryParse(value.replaceAll('년', ''));
      _suffix = '년';
    } else {
      // Try to parse as plain number
      _targetNumber = int.tryParse(value);
      _suffix = '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_targetNumber == null) {
      // If we can't parse the number, just show the original value
      return Text(widget.value, style: widget.style);
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentValue = _animation.value.toInt();
        return Text(
          '$currentValue${_suffix ?? ''}',
          style: widget.style,
        );
      },
    );
  }
}
