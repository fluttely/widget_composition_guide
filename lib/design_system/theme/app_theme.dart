/// **AppTheme - InheritedWidget Provider**
/// • Fornece Design Tokens via context
/// • Pattern: AppTheme.of(context).spacing.medium
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/design_system/theme/app_tokens.dart';

/// **InheritedWidget que injeta Design Tokens**
/// • Performance: rebuild apenas quando tokens mudam
/// • Type-safe access aos valores padronizados
class AppTheme extends InheritedWidget {
  /// Sistema de espaçamentos (4px múltiplos)
  final AppSpacing spacing;

  /// Sistema de border radius (cantos arredondados)
  final AppRadius radius;

  /// Sistema de tamanhos fixos (buttons, icons, avatars)
  final AppSizes sizes;

  /// Flag para debug visual (DebugContainer)
  final bool debugIsOn;

  /// Cria um provider de tema com os tokens especificados.
  ///
  /// [child] - Widget descendente que terá acesso aos tokens
  /// [spacing] - Sistema de espaçamentos (padrão: [AppSpacing])
  /// [radius] - Sistema de radius (padrão: [AppRadius])
  /// [sizes] - Sistema de tamanhos (padrão: [AppSizes])
  /// [debugIsOn] - Ativa debug visual (padrão: false)
  const AppTheme({
    super.key,
    required super.child,
    this.spacing = const AppSpacing(),
    this.radius = const AppRadius(),
    this.sizes = const AppSizes(),
    this.debugIsOn = false,
  });

  /// **Acesso estático ao AppTheme**
  /// • Uso: final theme = AppTheme.of(context)
  static AppTheme of(BuildContext context) {
    final AppTheme? result = context
        .dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  /// **UpdateShouldNotify - Performance**
  /// • Rebuild apenas quando tokens mudam
  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return spacing != oldWidget.spacing ||
        radius != oldWidget.radius ||
        sizes != oldWidget.sizes ||
        debugIsOn != oldWidget.debugIsOn;
  }
}
