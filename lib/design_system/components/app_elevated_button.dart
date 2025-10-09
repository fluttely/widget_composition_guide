/// **AppElevatedButton - Atomic Component**
/// • Encapsula ElevatedButton + Design Tokens
/// • fullWidth toggle, radius consistente
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Botão com Design Tokens aplicados**
/// • Radius: theme.radius.small (4px)
/// • Height: theme.sizes.buttonHeight (48px)
/// • fullWidth: SizedBox(width: double.infinity)
class AppElevatedButton extends StatelessWidget {
  /// Texto do botão
  final String label;

  /// Callback (null = disabled)
  final VoidCallback? onPressed;

  /// true = largura total, false = largura automática
  final bool fullWidth;

  /// Cria um botão elevado com design system aplicado.
  ///
  /// [label] - Texto do botão (obrigatório)
  /// [onPressed] - Callback de ação (null = desabilitado)
  /// [fullWidth] - Largura total ou automática (padrão: true)
  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    // Design tokens + conditional wrapper
    final theme = AppTheme.of(context);
    final smallRadius = theme.radius.small;
    final buttonHeight = theme.sizes.buttonHeight;

    // Base button com design tokens aplicados
    final button = SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Border radius do design token
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(smallRadius),
          ),
          // Touch target adequado
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        child: Text(label),
      ),
    );

    // Conditional wrapper: full width ou largura automática
    return fullWidth
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}
