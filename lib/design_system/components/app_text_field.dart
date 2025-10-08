import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final smallRadius = theme.radius.small;
    final extraSmallSpacing = theme.spacing.extraSmall;

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallRadius)),
          gapPadding: extraSmallSpacing,
        ),
      ),
      obscureText: isPassword,
    );
  }
}
