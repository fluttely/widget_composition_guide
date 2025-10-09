/// **SignUpPage - Composition + Estado**
/// • AuthForm + extraFields: [3 campos] • MVVM: acceptTerms state
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';
import 'package:widget_composition_guide/auth/signup/signup_page_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';

/// **Page com Estado - StatefulWidget**
/// • acceptTerms state para validação
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageView();
}

/// **View - Campos Extras**
/// • COMPOSITION: 3 campos específicos do SignUp
class _SignUpPageView extends SignUpPageViewModel {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Cadastro',
      buttonLabel: 'Criar conta',
      onButtonSubmit: submit,

      // COMPOSITION: 3 campos extras
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

/// **TermsCheckbox - Controlled Component**
/// • Callback pattern + área clicável expandida
class _TermsCheckbox extends StatelessWidget {
  /// Estado atual (aceito/não aceito)
  final bool acceptTerms;

  /// Callback para mudanças
  final ValueChanged<bool> onChanged;

  /// Cria checkbox de termos.
  const _TermsCheckbox({
    required this.acceptTerms,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Checkbox Material Design
        Checkbox(
          value: acceptTerms,
          onChanged: (value) => onChanged(value ?? false),
        ),

        // UX: texto clicável (área expandida)
        Expanded(
          child: GestureDetector(
            // Clique no texto = toggle checkbox
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
