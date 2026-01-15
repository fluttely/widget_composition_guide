/// **AppDesignSystem - InheritedWidget Otimizado**
/// • Design Tokens via context • AppDesignSystem.of(context)
/// • ScreenSizeInfo cacheada para máxima performance
/// • Tokens criados COM screenType - SEM context redundante
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_tokens.dart';
import 'package:widget_composition_guide/design_system/theme/screen_size_info.dart';

/// **Performance:** rebuild apenas quando tokens OU screenSize mudam
final class AppDesignSystem extends InheritedWidget {
  final ScreenSizeInfo screenSize;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppSizes sizes;
  final bool debugIsOn;

  const AppDesignSystem({
    super.key,
    required super.child,
    required this.screenSize,
    required this.spacing,
    required this.radius,
    required this.sizes,
    this.debugIsOn = false,
  });

  /// **Static access pattern - O(1) lookup**
  static AppDesignSystem of(BuildContext context) {
    final AppDesignSystem? result = context
        .dependOnInheritedWidgetOfExactType<AppDesignSystem>();
    assert(result != null, 'No AppDesignSystem found in context');
    return result!;
  }

  /// **Acesso rápido ao screenSize sem getter adicional**
  static ScreenSizeInfo screenSizeOf(BuildContext context) {
    return of(context).screenSize;
  }

  /// **Performance optimization**
  /// Compara apenas referências de objetos imutáveis
  @override
  bool updateShouldNotify(AppDesignSystem oldWidget) {
    return screenSize != oldWidget.screenSize ||
        spacing != oldWidget.spacing ||
        radius != oldWidget.radius ||
        sizes != oldWidget.sizes ||
        debugIsOn != oldWidget.debugIsOn;
  }
}

/// **Provider Widget - Gerencia ScreenSizeInfo automaticamente**
/// 🔥 LayoutBuilder só rebuilda quando constraints mudam!
final class AppDesignSystemProvider extends StatelessWidget {
  final Widget child;
  final bool debugIsOn;

  const AppDesignSystemProvider({
    super.key,
    required this.child,
    this.debugIsOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);

        // 🔥 Cria ScreenSizeInfo uma única vez
        final screenSize = ScreenSizeInfo.fromSize(
          mediaQuery.size,
          mediaQuery.orientation,
        );

        // 🔥 Cria tokens COM screenType - context passado apenas aqui
        final screenType = screenSize.type;
        final spacing = AppSpacing(screenType);
        final radius = AppRadius(screenType);
        final sizes = AppSizes(screenType);

        return AppDesignSystem(
          screenSize: screenSize,
          spacing: spacing,
          radius: radius,
          sizes: sizes,
          debugIsOn: debugIsOn,
          child: child,
        );
      },
    );
  }
}

final darkTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(primary: Color(0xffef6f3b)),
);
