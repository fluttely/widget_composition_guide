/// **AuthForm - Composition Pattern**
/// • extraFields dinâmicos por Page • MVVM + Loading
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_elevated_button.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **COMPOSITION CORE:** Login = [], SignUp = [3 campos]
class AuthForm extends StatefulWidget {
  final String title;
  final String buttonLabel;
  final VoidCallback onButtonSubmit;

  /// **COMPOSITION CORE - extraFields**
  final List<Widget> extraFields;

  const AuthForm({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onButtonSubmit,
    this.extraFields = const [],
  });

  @override
  State<AuthForm> createState() => _AuthFormView();
}

/// **View:** ...extraFields (spread operator) + Loading binding
class _AuthFormView extends AuthFormViewModel {
  @override
  Widget build(BuildContext context) {
    final theme = AppDesignSystem.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: theme.spacing.small,
      children: [
        const AppTextField(label: 'Email'),
        const AppTextField(label: 'Senha', isPassword: true),

        // COMPOSITION: spread operator
        ...widget.extraFields,

        SizedBox(height: theme.spacing.large),

        _Button(
          label: widget.buttonLabel,
          onPressed: isLoading ? () {} : handleSubmit,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

/// **Loading States:** CircularProgressIndicator ↔ AppElevatedButton
class _Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const _Button({
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = AppDesignSystem.of(context).sizes.buttonHeight;

    return isLoading
        ? Center(
            child: SizedBox(
              height: buttonHeight,
              width: buttonHeight,
              child: CircularProgressIndicator(),
            ),
          )
        : AppElevatedButton(
            onPressed: onPressed,
            label: label,
            fullWidth: true,
          );
  }
}
