/// **ScreenSizeInfo - Informações cacheadas de tela**
/// • Calcula uma vez, reutiliza múltiplas vezes
/// • Immutable para máxima performance
import 'package:flutter/widgets.dart';

enum ScreenSizeType {
  mobile,
  tablet,
  desktop,
}

/// **Classe imutável com cache de informações de tela**
@immutable
final class ScreenSizeInfo {
  final ScreenSizeType type;
  final double width;
  final double height;
  final Orientation orientation;

  const ScreenSizeInfo._({
    required this.type,
    required this.width,
    required this.height,
    required this.orientation,
  });

  /// **Factory que calcula o tipo baseado na largura**
  factory ScreenSizeInfo.fromSize(Size size, Orientation orientation) {
    final type = _calculateType(size.width);
    return ScreenSizeInfo._(
      type: type,
      width: size.width,
      height: size.height,
      orientation: orientation,
    );
  }

  /// **Breakpoints configuráveis**
  static const double kMobileBreakpoint = 768;
  static const double kTabletBreakpoint = 1280;

  static ScreenSizeType _calculateType(double width) {
    if (width < kMobileBreakpoint) return ScreenSizeType.mobile;
    if (width < kTabletBreakpoint) return ScreenSizeType.tablet;
    return ScreenSizeType.desktop;
  }

  // Helpers convenientes
  bool get isMobile => type == ScreenSizeType.mobile;
  bool get isTablet => type == ScreenSizeType.tablet;
  bool get isDesktop => type == ScreenSizeType.desktop;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  @override
  String toString() =>
      'ScreenSizeInfo(${type.name}, ${width.toInt()}×${height.toInt()})';
}

/// **Value final class para valores responsivos**
@immutable
final class ScreenSizeValue<T> {
  final T mobile;
  final T tablet;
  final T desktop;

  const ScreenSizeValue({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  /// **Acesso direto por tipo - O(1)**
  T get(ScreenSizeType type) {
    return switch (type) {
      ScreenSizeType.mobile => mobile,
      ScreenSizeType.tablet => tablet,
      ScreenSizeType.desktop => desktop,
    };
  }
}
