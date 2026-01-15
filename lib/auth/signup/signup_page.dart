import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';
import 'package:widget_composition_guide/auth/signup/signup_page_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';

final class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageView();
}

final class _SignUpPageView extends SignUpPageViewModel {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Cadastro',
      buttonLabel: 'Criar conta',
      onButtonSubmit: submit,
      extraFields: [
        const AppTextField(
          labelText: 'Confirmar Senha',
          isPassword: true,
        ),

        const AppTextField(
          labelText: 'Nome Completo',
        ),

        _TermsCheckbox(
          acceptTerms: acceptTerms,
          onChanged: (value) => setState(() => acceptTerms = value),
        ),
      ],
    );
  }
}

final class _TermsCheckbox extends StatelessWidget {
  final bool acceptTerms;

  final ValueChanged<bool> onChanged;

  const _TermsCheckbox({
    required this.acceptTerms,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: acceptTerms,
          onChanged: (value) => onChanged(value ?? false),
        ),

        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!acceptTerms),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'Li e aceito os termos de uso e política de privacidade',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
