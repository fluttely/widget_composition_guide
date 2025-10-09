/// **SignUpPage - Composition + Estado Local**
/// • AuthForm + extraFields: [confirmSenha, nome, termos]
/// • MVVM: Page → View → ViewModel (acceptTerms state)
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';
import 'package:widget_composition_guide/auth/signup/signup_page_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';

/// **Page com Estado - StatefulWidget**
/// • Funcionalidade completa: cadastro + validação
/// • Estado: acceptTerms (checkbox termos)
class SignUpPage extends StatefulWidget {
  /// Cria uma página de cadastro de usuário.
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageView();
}

/// **View - Composição de Campos**
/// • Injeta 3 campos extras: confirmSenha, nome, termos
/// • Validação: acceptTerms antes de submeter
class _SignUpPageView extends SignUpPageViewModel {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Cadastro',
      buttonLabel: 'Criar Conta',

      // Validação específica: termos obrigatórios
      onButtonSubmit: () {
        if (!acceptTerms) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Você deve aceitar os termos para continuar'),
            ),
          );
          return;
        }
        // TODO: API cadastro
        debugPrint('Conta criada com sucesso!');
      },

      // COMPOSITION: 3 campos extras específicos do cadastro
      extraFields: [
        // Campo extra: confirmação de senha
        const AppTextField(
          label: 'Confirmar Senha',
          isPassword: true,
        ),

        // Campo extra: nome completo
        const AppTextField(
          label: 'Nome Completo',
        ),

        // Componente extra: checkbox de termos
        _TermsCheckbox(
          acceptTerms: acceptTerms,
          onChanged: (value) => setState(() => acceptTerms = value),
        ),
      ],
    );
  }
}

/// **TermsCheckbox - Controlled Component**
/// • Callback pattern: estado gerenciado pelo pai
/// • UX: checkbox + texto clicável (área maior)
class _TermsCheckbox extends StatelessWidget {
  /// Estado atual (aceito/não aceito)
  final bool acceptTerms;

  /// Callback para mudanças de estado
  final ValueChanged<bool> onChanged;

  /// Cria um checkbox de aceite de termos.
  ///
  /// [acceptTerms] - Estado atual do aceite
  /// [onChanged] - Callback para mudanças de estado
  const _TermsCheckbox({
    required this.acceptTerms,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Checkbox padrão do Material Design
        Checkbox(
          value: acceptTerms,
          onChanged: (value) => onChanged(value ?? false),
        ),

        // Área expandida para melhor UX - texto clicável
        Expanded(
          child: GestureDetector(
            // Permite clicar no texto para marcar/desmarcar
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
