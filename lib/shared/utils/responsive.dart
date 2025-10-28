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
