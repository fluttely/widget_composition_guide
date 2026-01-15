/// **Design Tokens - Sistema Centralizado**
/// • Valores padronizados: Spacing, Radius, Sizes
/// • Baseado em múltiplos de 4px (Material Design)

/// **AppSpacing - Sistema de Espaçamentos**
/// • Múltiplos de 4px: extraSmall(4) → extraLarge(32)
/// • Uso: EdgeInsets.all(theme.spacing.medium)
final class AppSpacing {
  const AppSpacing();

  final double _superSmall =
      2.0; // ← 2px - separação para casos muito específicos
  final double _extraSmall = 4.0; // ← 4px - separação mínima
  final double _small = 8.0; // ← 8px - elementos relacionados
  final double _medium = 16.0; // ← 16px - padrão mais usado
  final double _large = 24.0; // ← 24px - separação entre seções
  final double _extraLarge = 32.0; // ← 32px - separação máxima
  final double _superLarge =
      48.0; // ← 48px - separação para casos muito específicos

  double get logo => _large; // ← 24px
  double get content => _large; // ← 24px
  double get screen => _extraLarge; // ← 32px
  double get textFormField => _extraSmall; // ← 4px
  double get authFormContent => _extraLarge; // ← 32px
  double get authFormFields => _small; // ← 8px
}

/// **AppRadius - Border Radius System**
/// • Uso: BorderRadius.circular(theme.radius.medium)
final class AppRadius {
  const AppRadius();

  final double _small = 4.0; // ← 4px - componentes pequenos
  final double _medium = 8.0; // ← 8px - padrão mais usado
  final double _large = 16.0; // ← 16px - componentes de destaque

  double get textFormField => _small; // ← 4px
  double get button => _small; // ← 4px
}

/// **AppSizes - Tamanhos Fixos**
/// • Touch targets (44px min), Buttons (48px), Icons (24px)
/// • Baseado em diretrizes de acessibilidade
final class AppSizes {
  const AppSizes();
  final double buttonHeight = 48.0; // ← 48px - botões principais
  final double iconSizeSmall = 16.0; // ← 16px - ícones pequenos
  final double iconSizeMedium = 24.0; // ← 24px - ícones padrão
  final double iconSizeLarge = 32.0; // ← 32px - ícones grandes
  final double avatarSize = 40.0; // ← 40px - avatares pequenos
  final double avatarSizeMedium = 56.0; // ← 56px - avatares médios
  final double minTouchTarget =
      44.0; // ← 44px - área mínima de toque (iOS + Material)
}
