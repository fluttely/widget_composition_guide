/// **AppDesignSystem - InheritedWidget**
/// • Design Tokens via context • AppDesignSystem.of(context)
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_tokens.dart';

/// **Performance:** rebuild apenas quando tokens mudam
class AppDesignSystem extends InheritedWidget {
  final ThemeData darkTheme;
  final AppSpacing spacing;
  final AppRadius radius;
  final AppSizes sizes;
  final bool debugIsOn;

  const AppDesignSystem({
    super.key,
    required super.child,
    required this.darkTheme,
    this.spacing = const AppSpacing(),
    this.radius = const AppRadius(),
    this.sizes = const AppSizes(),
    this.debugIsOn = false,
  });

  /// **Static access pattern**
  static AppDesignSystem of(BuildContext context) {
    final AppDesignSystem? result = context
        .dependOnInheritedWidgetOfExactType<AppDesignSystem>();
    assert(result != null, 'No AppDesignSystem found in context');
    return result!;
  }

  /// **Performance optimization**
  @override
  bool updateShouldNotify(AppDesignSystem oldWidget) {
    return spacing != oldWidget.spacing ||
        radius != oldWidget.radius ||
        sizes != oldWidget.sizes ||
        debugIsOn != oldWidget.debugIsOn;
  }
}

final darkTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(primary: Color(0xffef6f3b)),
);
