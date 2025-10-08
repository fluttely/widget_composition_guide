import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_button.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class AuthForm extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final VoidCallback onSubmit;
  // A MÁGICA ACONTECE AQUI!
  final List<Widget> extraFields;

  const AuthForm({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onSubmit,
    this.extraFields = const [], // Valor padrão é uma lista vazia
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final smallSpacing = theme.spacing.small;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: smallSpacing,
      children: [
        // Campos que SEMPRE existem
        const AppTextField(label: 'Email'),
        const AppTextField(label: 'Senha', isPassword: true),

        // Campos EXTRAS que podem ou não existir
        ...extraFields,

        const SizedBox(height: 20),
        AuthButton(label: buttonLabel, onPressed: onSubmit, isLoading: false),
      ],
    );
  }
}
