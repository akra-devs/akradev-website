import 'dart:ui';

double horizontalPadding(double width) {
  if (width >= 1440) {
    return 196;
  }
  if (width >= 1200) {
    return 160;
  }
  if (width >= 992) {
    return 120;
  }
  if (width >= 768) {
    return 80;
  }
  if (width >= 480) {
    return 40;
  }
  return 24;
}

double textScale(
  double width, {
  double minWidth = 360,
  double maxWidth = 1440,
  double minScale = 0.78,
  double maxScale = 1.0,
}) {
  final clampedWidth = width.clamp(minWidth, maxWidth);
  final normalized =
      ((clampedWidth - minWidth) / (maxWidth - minWidth)).clamp(0.0, 1.0);

  return lerpDouble(minScale, maxScale, normalized.toDouble())!;
}
