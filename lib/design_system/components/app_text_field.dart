/// **AppTextField - Input Component**
/// • TextFormField + Design Tokens
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
    final theme = AppDesignSystem.of(context);

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(theme.radius.small)),
          gapPadding: theme.spacing.extraSmall,
        ),
      ),
      obscureText: isPassword,
    );
  }
}
