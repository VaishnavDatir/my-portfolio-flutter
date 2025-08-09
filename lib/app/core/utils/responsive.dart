import 'package:flutter/material.dart';

/// Simple responsive helpers for breakpoints + fluid card sizing.
enum DeviceScreenType { mobile, tablet, desktop }

class Responsive {
  // Tweak these breakpoints to match your design
  static const double _mobileMaxWidth = 600;
  static const double _tabletMaxWidth = 1024;

  static DeviceScreenType deviceScreenType(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w <= _mobileMaxWidth) return DeviceScreenType.mobile;
    if (w <= _tabletMaxWidth) return DeviceScreenType.tablet;
    return DeviceScreenType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      deviceScreenType(context) == DeviceScreenType.mobile;
  static bool isTablet(BuildContext context) =>
      deviceScreenType(context) == DeviceScreenType.tablet;
  static bool isDesktop(BuildContext context) =>
      deviceScreenType(context) == DeviceScreenType.desktop;

  /// How many columns fit given a minimum card width.
  /// Will always return at least 1 and at most [maxColumns].
  static int columnsForWidth(
    BuildContext context, {
    double minCardWidth = 250,
    int maxColumns = 3,
  }) {
    final w = MediaQuery.of(context).size.width;
    final columns = (w / minCardWidth).floor();
    if (columns < 1) return 1;
    return columns > maxColumns ? maxColumns : columns;
  }

  /// Compute a good item width (px) for cards given:
  /// - minCardWidth: the minimum desirable width per card
  /// - spacing: the horizontal spacing between cards
  /// - maxColumns: upper limit for columns
  /// - horizontalPadding: total horizontal padding around the group (left+right)
  static double itemWidth(
    BuildContext context, {
    double minCardWidth = 250,
    double spacing = 8,
    int maxColumns = 3,
    double horizontalPadding = 32,
  }) {
    final columns = columnsForWidth(
      context,
      minCardWidth: minCardWidth,
      maxColumns: maxColumns,
    );
    final totalSpacing = (columns - 1) * spacing + horizontalPadding;
    final available = MediaQuery.of(context).size.width - totalSpacing;
    // fallback to minCardWidth when available space is small
    final width = available / columns;
    return width < minCardWidth
        ? minCardWidth.clamp(0, MediaQuery.of(context).size.width)
        : width;
  }

  /// A small helper for responsive padding you can reuse
  static EdgeInsets responsivePadding(
    BuildContext context, {
    double mobile = 12,
    double tablet = 20,
    double desktop = 32,
  }) {
    if (isMobile(context)) return EdgeInsets.all(mobile);
    if (isTablet(context)) return EdgeInsets.all(tablet);
    return EdgeInsets.all(desktop);
  }
}
