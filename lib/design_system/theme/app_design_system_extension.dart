/// **Extension para acesso conveniente - OTIMIZADA**
/// • Syntax sugar para uso comum
/// • SEM context redundante
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';
import 'package:widget_composition_guide/design_system/theme/app_tokens.dart';
import 'package:widget_composition_guide/design_system/theme/screen_size_info.dart';

extension AppDesignSystemExtension on BuildContext {
  /// **Acesso direto ao design system**
  AppDesignSystem get ds => AppDesignSystem.of(this);

  /// **Acesso rápido aos tokens - JÁ TEM screenType embutido**
  AppSpacing get spacing => ds.spacing;
  AppRadius get radius => ds.radius;
  AppSizes get sizes => ds.sizes;

  /// **Acesso direto ao screenSize**
  ScreenSizeInfo get screenSize => ds.screenSize;
  ScreenSizeType get screenType => ds.screenSize.type;

  /// **Helpers booleanos**
  bool get isMobile => screenSize.isMobile;
  bool get isTablet => screenSize.isTablet;
  bool get isDesktop => screenSize.isDesktop;
  bool get isPortrait => screenSize.isPortrait;
  bool get isLandscape => screenSize.isLandscape;

  /// **Helper para valores responsivos inline**
  T responsive<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    final value = ScreenSizeValue<T>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return value.get(screenType);
  }

  /// **Helper simplificado (usa mobile como fallback)**
  T responsiveOr<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return responsive(
      mobile: mobile,
      tablet: tablet ?? mobile,
      desktop: desktop ?? tablet ?? mobile,
    );
  }
}
