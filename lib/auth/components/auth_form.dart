/// **AuthForm - Composite Pattern**
/// • extraFields dinâmicos por Page • MVVM + Loading
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_elevated_button.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';

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
    final spacing = AppDesignSystem.of(context).spacing;
    final spacingExtraLarge = spacing.extraLarge;

    return Column(
      spacing: spacingExtraLarge,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        _Fields(extraFields: widget.extraFields),

        _Button(
          label: widget.buttonLabel,
          onPressed: handleSubmit,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

class _Fields extends StatelessWidget {
  final List<Widget> extraFields;

  const _Fields({required this.extraFields});

  @override
  Widget build(BuildContext context) {
    final spacing = AppDesignSystem.of(context).spacing;
    final spacingSmall = spacing.small;

    return Column(
      spacing: spacingSmall,
      children: [
        const AppTextField(label: 'Email'),
        const AppTextField(label: 'Senha', isPassword: true),

        // COMPOSITION: spread operator
        ...extraFields,
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
            onPressed: isLoading ? null : onPressed,
            label: label,
            fullWidth: true,
          );
  }
}
