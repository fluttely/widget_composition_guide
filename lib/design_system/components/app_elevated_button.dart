/// **AppElevatedButton - Atomic Component**
/// • ElevatedButton + Design Tokens + fullWidth toggle
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Design Tokens:** radius.small + sizes.buttonHeight + fullWidth conditional
class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool fullWidth;

  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppDesignSystem.of(context);

    final button = SizedBox(
      height: theme.sizes.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.radius.small),
          ),
        ),
        child: Text(label),
      ),
    );

    // Conditional wrapper pattern
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
