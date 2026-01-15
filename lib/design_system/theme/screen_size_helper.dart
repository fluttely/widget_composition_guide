import 'package:flutter/widgets.dart';

enum ScreenSizeType {
  mobile,
  tablet,
  desktop,
}

final class ScreenSizeValue<T> {
  final T mobile;
  final T tablet;
  final T desktop;

  const ScreenSizeValue({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });
}

final class ScreenSizeHelper {
  static const double kMobileBreakpoint = 768; // Até 768px = mobile
  static const double kTabletBreakpoint = 1280; // 768-1280px = tablet

  static MediaQueryData _getMediaQuery(BuildContext context) =>
      MediaQuery.of(context);

  static Size _getScreenDimensions(BuildContext context) =>
      _getMediaQuery(context).size;

  static ScreenSizeType _getScreenSizeType(BuildContext context) {
    final width = _getScreenDimensions(context).width;
    if (width < kMobileBreakpoint) {
      return ScreenSizeType.mobile;
    } else if (width < kTabletBreakpoint) {
      return ScreenSizeType.tablet;
    }
    return ScreenSizeType.desktop;
  }

  static T getValue<T>(BuildContext context, ScreenSizeValue<T> values) {
    final type = _getScreenSizeType(context);
    return switch (type) {
      ScreenSizeType.mobile => values.mobile,
      ScreenSizeType.tablet => values.tablet,
      ScreenSizeType.desktop => values.desktop,
    };
  }
}
