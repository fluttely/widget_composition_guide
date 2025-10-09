/// **AppTextButton - Secondary Button**
/// • TextButton + Design Tokens, fullWidth toggle
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  /// Se true, o botão ocupa toda a largura disponível
  final bool fullWidth;

  const AppTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final smallRadius = theme.radius.small;
    final buttonHeight = theme.sizes.buttonHeight;

    final button = SizedBox(
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(smallRadius),
          ),
        ),
        child: Text(label),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
