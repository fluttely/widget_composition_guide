/// # Design Tokens - Sistema de Valores de Design
///
/// Define os tokens fundamentais do design system, estabelecendo valores
/// consistentes para espaçamentos, border radius e tamanhos em toda a aplicação.
///
/// ## Princípios dos Design Tokens:
/// - **Consistência:** Valores padronizados em toda a aplicação
/// - **Escalabilidade:** Fácil manutenção e evolução
/// - **Semantica:** Nomes descritivos para diferentes tamanhos
/// - **Reutilização:** Valores centralizados e reutilizáveis
///
/// ## Referências:
/// - [Design Tokens Handbook](https://www.designbetter.co/design-systems-handbook)
/// - [Material Design Space Guidelines](https://material.io/design/layout/spacing.html)

/// Sistema de espaçamentos baseado em múltiplos de 4px.
///
/// Segue as diretrizes de Material Design para espaçamentos consistentes.
/// Todos os valores são múltiplos de 4px para alinhamento perfeito em grids.
///
/// ## Escala de Espaçamentos:
/// - **extraSmall (4px):** Espaçamentos mínimos, separação sutil
/// - **small (8px):** Espaçamentos pequenos entre elementos relacionados
/// - **medium (16px):** Espaçamento padrão, mais usado na aplicação
/// - **large (24px):** Espaçamentos grandes entre seções
/// - **extraLarge (32px):** Espaçamentos máximos, separação de blocos
///
/// ## Exemplo de Uso:
/// ```dart
/// final theme = AppTheme.of(context);
/// EdgeInsets.all(theme.spacing.medium)           // 16px
/// SizedBox(height: theme.spacing.large)          // 24px
/// Padding.symmetric(horizontal: theme.spacing.small) // 8px
/// ```
class AppSpacing {
  /// Cria uma instância imutável do sistema de espaçamentos.
  const AppSpacing();

  /// Espaçamento extra pequeno (4px).
  ///
  /// Usado para separações mínimas entre elementos muito relacionados.
  /// Ideal para: separação de ícones, ajustes finos de posicionamento.
  final double extraSmall = 4.0;

  /// Espaçamento pequeno (8px).
  ///
  /// Usado para separação entre elementos relacionados dentro de um grupo.
  /// Ideal para: gaps em rows/columns, padding interno de componentes.
  final double small = 8.0;

  /// Espaçamento médio (16px) - **VALOR PADRÃO**.
  ///
  /// Espaçamento mais utilizado na aplicação, base para a maioria dos layouts.
  /// Ideal para: padding de cards, margem entre campos de formulário.
  final double medium = 16.0;

  /// Espaçamento grande (24px).
  ///
  /// Usado para separação entre seções diferentes de uma tela.
  /// Ideal para: espaçamento entre blocos de conteúdo, padding de telas.
  final double large = 24.0;

  /// Espaçamento extra grande (32px).
  ///
  /// Maior espaçamento disponível, usado para separação máxima.
  /// Ideal para: padding de telas principais, separação de módulos.
  final double extraLarge = 32.0;
}

/// Sistema de border radius para componentes arredondados.
///
/// Define valores consistentes para cantos arredondados seguindo
/// as diretrizes de Material Design e princípios de hierarquia visual.
///
/// ## Escala de Border Radius:
/// - **small (4px):** Radius sutil, componentes pequenos
/// - **medium (8px):** Radius padrão, maioria dos componentes
/// - **large (16px):** Radius pronunciado, componentes de destaque
///
/// ## Exemplo de Uso:
/// ```dart
/// final theme = AppTheme.of(context);
/// BorderRadius.circular(theme.radius.medium)     // 8px
/// RoundedRectangleBorder(
///   borderRadius: BorderRadius.circular(theme.radius.small) // 4px
/// )
/// ```
class AppRadius {
  /// Cria uma instância imutável do sistema de border radius.
  const AppRadius();

  /// Border radius pequeno (4px).
  ///
  /// Usado para componentes pequenos que precisam de cantos levemente arredondados.
  /// Ideal para: botões pequenos, badges, chips.
  final double small = 4.0;

  /// Border radius médio (8px) - **VALOR PADRÃO**.
  ///
  /// Radius mais utilizado na aplicação, adequado para a maioria dos componentes.
  /// Ideal para: botões principais, cards, inputs de texto.
  final double medium = 8.0;

  /// Border radius grande (16px).
  ///
  /// Usado para componentes de destaque que precisam de cantos mais arredondados.
  /// Ideal para: modais, containers principais, componentes hero.
  final double large = 16.0;
}

/// Sistema de tamanhos fixos para componentes da aplicação.
///
/// Define alturas, larguras e dimensões padronizadas para componentes
/// que precisam de tamanhos consistentes em toda a aplicação.
///
/// ## Escala de Tamanhos:
/// - **buttonHeight (48px):** Altura padrão para botões principais
/// - **iconSize (24px):** Tamanho padrão para ícones
/// - **avatarSize (40px):** Tamanho padrão para avatares pequenos
/// - **minTouchTarget (44px):** Área mínima de toque (iOS HIG + Material)
///
/// ## Exemplo de Uso:
/// ```dart
/// final theme = AppTheme.of(context);
/// SizedBox(
///   height: theme.sizes.buttonHeight,     // 48px
///   child: ElevatedButton(...),
/// )
/// Icon(Icons.star, size: theme.sizes.iconSize)  // 24px
/// ```
///
/// ## Design Guidelines:
/// - **Touch Targets:** Mínimo 44px para acessibilidade
/// - **Button Heights:** 48px para botões primários, 40px para secundários
/// - **Icon Sizes:** 24px padrão, 16px pequenos, 32px grandes
class AppSizes {
  /// Cria uma instância imutável do sistema de tamanhos.
  const AppSizes();

  /// Altura padrão para botões principais (48px).
  ///
  /// Segue diretrizes de Material Design para botões primários.
  /// Garante área de toque adequada e hierarquia visual clara.
  /// Ideal para: botões de ação principal, submit de formulários.
  final double buttonHeight = 48.0;

  /// Altura para botões secundários (40px).
  ///
  /// Menor que botões primários para criar hierarquia visual.
  /// Ainda mantém área de toque adequada para acessibilidade.
  /// Ideal para: botões de cancelar, ações secundárias.
  final double buttonHeightSecondary = 40.0;

  /// Tamanho padrão para ícones (24px).
  ///
  /// Tamanho mais usado para ícones em botões, listas e navegação.
  /// Baseado nas diretrizes do Material Design Icon System.
  /// Ideal para: ícones em botões, navigation bar, app bar.
  final double iconSize = 24.0;

  /// Tamanho pequeno para ícones (16px).
  ///
  /// Usado para ícones em textos, badges e elementos compactos.
  /// Mantém legibilidade em espaços reduzidos.
  /// Ideal para: ícones inline, indicators, micro-interactions.
  final double iconSizeSmall = 16.0;

  /// Tamanho grande para ícones (32px).
  ///
  /// Usado para ícones de destaque, placeholders e áreas hero.
  /// Cria impacto visual e facilita reconhecimento.
  /// Ideal para: empty states, placeholders, ícones principais.
  final double iconSizeLarge = 32.0;

  /// Tamanho padrão para avatares pequenos (40px).
  ///
  /// Usado em listas, comentários e áreas compactas.
  /// Mantém reconhecimento facial em tamanho reduzido.
  /// Ideal para: listas de usuários, comentários, chat.
  final double avatarSize = 40.0;

  /// Tamanho médio para avatares (56px).
  ///
  /// Usado em perfis, headers e áreas de destaque.
  /// Permite melhor reconhecimento e hierarquia visual.
  /// Ideal para: perfil de usuário, headers, destaque.
  final double avatarSizeMedium = 56.0;

  /// Área mínima de toque recomendada (44px).
  ///
  /// Baseada em diretrizes de acessibilidade (iOS HIG + Material).
  /// Garante que elementos sejam facilmente tocáveis em dispositivos móveis.
  /// Usado para: validação de touch targets, padding mínimo.
  final double minTouchTarget = 44.0;

  /// Altura padrão para campos de input (56px).
  ///
  /// Altura adequada para text fields seguindo Material Design.
  /// Inclui espaço para label, texto e feedback visual.
  /// Ideal para: TextField, DropdownButton, form inputs.
  final double inputHeight = 56.0;

  /// Largura máxima para conteúdo principal (600px).
  ///
  /// Limita largura de leitura para melhor experiência em telas grandes.
  /// Baseada em estudos de legibilidade e UX patterns.
  /// Ideal para: forms, artigos, conteúdo principal em desktop.
  final double maxContentWidth = 600.0;
}
