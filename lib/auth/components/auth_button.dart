import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/app_button.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : AppButton(
            onPressed: onPressed,
            label: label,
            fullWidth: false,
          );
  }
}
