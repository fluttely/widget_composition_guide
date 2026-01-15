/// **AuthForm - Composite Pattern (REFATORADO)**
/// • extraFields dinâmicos por Page • MVVM + Loading
/// • SEM context redundante nos getters
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

class _AuthFormView extends AuthFormViewModel {
  @override
  Widget build(BuildContext context) {
    // 🔥 Acessa UMA VEZ - tokens já tem screenType
    final ds = AppDesignSystem.of(context);
    final spacing = ds.spacing;

    return Column(
      spacing: spacing.authFormContent, // 🔥 SEM context!
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _Fields(extraFields: widget.extraFields),
        _Button(
          labelText: widget.buttonLabel,
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

    return Column(
      spacing: spacing.authFormFields, // 🔥 SEM context!
      children: [
        const AppTextField(labelText: 'Email'),
        const AppTextField(labelText: 'Senha', isPassword: true),
        ...extraFields,
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;

  const _Button({
    required this.labelText,
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
            labelText: labelText,
            fullWidth: true,
          );
  }
}
