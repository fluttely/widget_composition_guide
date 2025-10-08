/// # Design System - Theme Provider
///
/// Implementa o sistema de design tokens usando [InheritedWidget] nativo do Flutter.
/// Fornece acesso centralizado aos tokens de design em toda a árvore de widgets.
///
/// ## Padrão Implementado:
/// - **InheritedWidget Pattern** para injeção de dependência
/// - **Design Tokens** para consistência visual
/// - **Theme Provider** para configuração centralizada
///
/// ## Tokens Disponíveis:
/// - [AppSpacing] - Sistema de espaçamentos
/// - [AppRadius] - Sistema de border radius
/// - [AppSizes] - Sistema de tamanhos fixos
/// - [debugIsOn] - Flag para helpers visuais
///
/// **Referência:** [Flutter InheritedWidget Documentation](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/design_system/theme/app_tokens.dart';

/// Provider de tema personalizado que injeta tokens de design na árvore de widgets.
///
/// Utiliza [InheritedWidget] para disponibilizar tokens de design em qualquer
/// lugar da aplicação sem necessidade de prop drilling.
///
/// ## Exemplo de Uso:
/// ```dart
/// final theme = AppTheme.of(context);
/// final spacing = theme.spacing.medium; // 16.0
/// final radius = theme.radius.small;    // 4.0
/// final height = theme.sizes.buttonHeight; // 48.0
/// ```
///
/// ## Benefícios:
/// - **Performance:** Rebuilt apenas quando tokens mudam
/// - **Acessibilidade:** Disponível em qualquer widget descendente
/// - **Tipagem:** Type-safe access aos tokens
/// - **Flexibilidade:** Permite override de tokens por contexto
///
/// ## Arquitetura:
/// ```
/// AppTheme (InheritedWidget)
/// ├── AppSpacing (Design Tokens)
/// ├── AppRadius (Design Tokens)
/// ├── AppSizes (Design Tokens)
/// └── debugIsOn (Development Tool)
/// ```
class AppTheme extends InheritedWidget {
  /// Sistema de espaçamentos da aplicação.
  ///
  /// Contém todos os valores padronizados para margins, paddings e gaps.
  final AppSpacing spacing;

  /// Sistema de border radius da aplicação.
  ///
  /// Define valores consistentes para cantos arredondados de componentes.
  final AppRadius radius;

  /// Sistema de tamanhos fixos da aplicação.
  ///
  /// Define alturas, larguras e dimensões padronizadas para componentes.
  final AppSizes sizes;

  /// Flag para ativação de ferramentas de debug visual.
  ///
  /// Quando `true`, ativa [DebugContainer] e outros helpers visuais.
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

  /// Acessa a instância do [AppTheme] mais próxima na árvore de widgets.
  ///
  /// Deve ser chamado dentro do contexto de um widget descendente.
  /// Throws [AssertionError] se nenhum [AppTheme] for encontrado.
  ///
  /// ## Exemplo:
  /// ```dart
  /// final theme = AppTheme.of(context);
  /// final padding = EdgeInsets.all(theme.spacing.large);
  /// ```
  static AppTheme of(BuildContext context) {
    final AppTheme? result = context
        .dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  /// Determina se os widgets dependentes devem ser reconstruídos.
  ///
  /// Retorna `true` quando os tokens de spacing ou radius mudam,
  /// garantindo que a UI seja atualizada com os novos valores.
  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return spacing != oldWidget.spacing ||
        radius != oldWidget.radius ||
        sizes != oldWidget.sizes ||
        debugIsOn != oldWidget.debugIsOn;
  }
}
