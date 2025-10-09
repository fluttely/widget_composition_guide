/// **Design Tokens - Sistema Centralizado**
/// • Valores padronizados: Spacing, Radius, Sizes
/// • Baseado em múltiplos de 4px (Material Design)

/// **AppSpacing - Sistema de Espaçamentos**
/// • Múltiplos de 4px: extraSmall(4) → extraLarge(32)
/// • Uso: EdgeInsets.all(theme.spacing.medium)
class AppSpacing {
  const AppSpacing();

  final double extraSmall = 4.0; // ← 4px - separação mínima

  final double small = 8.0; // ← 8px - elementos relacionados

  final double medium = 16.0; // ← 16px - padrão mais usado

  final double large = 24.0; // ← 24px - separação entre seções

  final double extraLarge = 32.0; // ← 32px - separação máxima
}

/// **AppRadius - Border Radius System**
/// • small(4px), medium(8px), large(16px)
/// • Uso: BorderRadius.circular(theme.radius.medium)
class AppRadius {
  const AppRadius();

  /// 4px - componentes pequenos
  final double small = 4.0;

  /// 8px - padrão mais usado
  final double medium = 8.0;

  /// 16px - componentes de destaque
  final double large = 16.0;
}

/// **AppSizes - Tamanhos Fixos**
/// • Touch targets (44px min), Buttons (48px), Icons (24px)
/// • Baseado em diretrizes de acessibilidade
class AppSizes {
  const AppSizes();

  /// 48px - botões principais
  final double buttonHeight = 48.0;

  /// 40px - botões secundários
  final double buttonHeightSecondary = 40.0;

  /// 24px - ícones padrão
  final double iconSize = 24.0;

  /// 16px - ícones pequenos
  final double iconSizeSmall = 16.0;

  /// 32px - ícones grandes
  final double iconSizeLarge = 32.0;

  /// 40px - avatares pequenos
  final double avatarSize = 40.0;

  /// 56px - avatares médios
  final double avatarSizeMedium = 56.0;

  /// 44px - área mínima de toque (iOS + Material)
  final double minTouchTarget = 44.0;

  /// 56px - altura de inputs
  final double inputHeight = 56.0;

  /// 600px - largura máxima de conteúdo
}
