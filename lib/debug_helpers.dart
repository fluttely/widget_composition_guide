/// # Debug Helpers - Ferramentas de Desenvolvimento
///
/// Conjunto de utilitários para debug visual durante o desenvolvimento,
/// permitindo identificar facilmente áreas de layout e hierarquia de componentes.
///
/// ## Funcionalidades:
/// - **DebugContainer:** Overlay colorido para visualizar áreas de layout
/// - **DebugColors:** Paleta de cores para diferentes tipos de componentes
/// - **Toggle condicional:** Ativado/desativado via AppTheme.debugIsOn
///
/// ## Benefícios:
/// - **Debug visual:** Identifica rapidamente problemas de layout
/// - **Hierarquia clara:** Diferentes cores para diferentes responsabilidades
/// - **Produção segura:** Automaticamente removido quando debugIsOn = false
///
/// **Inspiração:** Flutter Inspector + Custom Debug Tools
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// Paleta de cores para debug visual de diferentes áreas da aplicação.
///
/// Cada cor representa um tipo específico de componente ou área,
/// facilitando a identificação de responsabilidades e hierarquia.
///
/// ## Mapeamento de Cores:
/// - **Blue:** Áreas de imagem/mídia
/// - **Purple:** Áreas de formulário/input
/// - **Yellow:** Áreas de ação/botões
///
/// ## Uso Recomendado:
/// ```dart
/// DebugContainer(
///   color: DebugColors.formArea,  // Roxo para formulários
///   child: MyFormWidget(),
/// )
/// ```
class DebugColors {
  /// Cor para áreas de imagem, mídia e conteúdo visual.
  ///
  /// **Azul** - Facilmente identificável para elementos de mídia.
  static const Color imageArea = Colors.blue;

  /// Cor para áreas de formulário, inputs e campos de entrada.
  ///
  /// **Roxo** - Alta visibilidade para elementos de interação.
  static const Color formArea = Colors.purple;

  /// Cor para áreas de botões, ações e elementos clicáveis.
  ///
  /// **Amarelo** - Destaque para elementos de ação.
  static const Color buttonArea = Colors.yellow;
}

/// Container de debug que overlay uma cor de fundo quando debug está ativo.
///
/// Permite visualizar facilmente as áreas ocupadas por diferentes componentes
/// durante o desenvolvimento, sem afetar o comportamento em produção.
///
/// ## Comportamento:
/// - **Debug ON:** Mostra cor de fundo especificada
/// - **Debug OFF:** Completamente transparente (Colors.transparent)
///
/// ## Exemplo de Uso:
/// ```dart
/// DebugContainer(
///   color: DebugColors.formArea,
///   child: Column(
///     children: [
///       TextField(),
///       ElevatedButton(),
///     ],
///   ),
/// )
/// ```
///
/// ## Integração com AppTheme:
/// O estado de debug é controlado centralmente via [AppTheme.debugIsOn],
/// permitindo ativar/desativar todos os helpers visuais simultaneamente.
class DebugContainer extends StatelessWidget {
  /// Cor de fundo a ser exibida quando debug estiver ativo.
  ///
  /// Recomenda-se usar cores da [DebugColors] para consistência.
  final Color color;

  /// Widget filho que será renderizado dentro do container.
  ///
  /// O comportamento do widget filho não é afetado pelo debug container.
  final Widget child;

  /// Cria um container de debug com cor e widget filho especificados.
  ///
  /// [color] - Cor de overlay para debug visual
  /// [child] - Widget que será envolvido pelo debug container
  const DebugContainer({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Acessa o tema para verificar se debug está ativo
    final theme = AppTheme.of(context);
    final debugIsOn = theme.debugIsOn;

    return Container(
      // Conditional rendering: cor quando debug ativo, transparente caso contrário
      color: debugIsOn ? color : Colors.transparent,
      child: child,
    );
  }
}
