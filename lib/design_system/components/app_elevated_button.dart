/// **AppElevatedButton - Atomic Component**
/// • ElevatedButton + Design Tokens + fullWidth toggle
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';

/// **Design Tokens:** radius.small + sizes.buttonHeight + fullWidth conditional
class AppElevatedButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final bool fullWidth;

  const AppElevatedButton({
    super.key,
    required this.labelText,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppDesignSystem.of(context);
    final buttonHeight = theme.sizes.buttonHeight;
    final radiusSmall = theme.radius.small;

    final button = SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
        ),
        child: Text(labelText),
      ),
    );

    // Conditional wrapper pattern
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
