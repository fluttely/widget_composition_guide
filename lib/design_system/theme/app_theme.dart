import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/design_system/theme/tokens.dart';

class AppTheme extends InheritedWidget {
  final AppSpacing spacing;
  final AppRadius radius;
  final bool debugIsOn;

  const AppTheme({
    super.key,
    required super.child,
    this.spacing = const AppSpacing(),
    this.radius = const AppRadius(),
    this.debugIsOn = false,
  });

  static AppTheme of(BuildContext context) {
    final AppTheme? result = context
        .dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return spacing != oldWidget.spacing || radius != oldWidget.radius;
  }
}
