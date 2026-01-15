/// **AppTextButton - Secondary Button**
/// • TextButton + Design Tokens + fullWidth toggle
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';

final class AppTextButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final bool fullWidth;

  const AppTextButton({
    super.key,
    required this.labelText,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppDesignSystem.of(context);
    final sizes = theme.sizes;
    final radius = theme.radius;

    final button = SizedBox(
      height: sizes.buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.button),
          ),
        ),
        child: Text(labelText),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
