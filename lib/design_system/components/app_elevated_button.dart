import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  /// Se true, o botão ocupa toda a largura disponível
  final bool fullWidth;

  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final smallRadius = theme.radius.small;

    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(smallRadius),
        ),
      ),
      child: Text(label),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
