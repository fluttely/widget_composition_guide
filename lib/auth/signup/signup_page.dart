/// # SignUp Page - Página de Cadastro de Usuário
///
/// Page específica para funcionalidade de cadastro que demonstra
/// Composition Pattern e separação MVVM entre Page e View.
///
/// ## Responsabilidades da Page:
/// - **Funcionalidade específica:** Apenas cadastro de usuário
/// - **Estado local:** Gerencia aceitação de termos
/// - **Validação:** Verifica se termos foram aceitos
/// - **Composição:** Usa AuthForm com campos extras específicos
///
/// ## Diferenças Arquiteturais:
/// - **Screen:** Coordena múltiplas Pages (AuthScreen conhece Login + SignUp)
/// - **Page:** Funcionalidade específica (SignUpPage só conhece cadastro)
/// - **View:** Apenas apresentação (não contém lógica de negócio)
///
/// ## Composition Pattern:
/// Reutiliza AuthForm injetando campos específicos do cadastro:
/// - Confirmação de senha
/// - Nome completo
/// - Checkbox de aceite de termos
///
/// ## Arquitetura MVVM:
/// ```
/// SignUpPage (StatefulWidget) ← Page
/// ├── _SignUpPageView (View - Presentation)
/// └── SignUpPageViewModel (ViewModel - Logic)
///     └── AuthForm (Composition)
///         └── extraFields (Campos específicos)
/// ```
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';
import 'package:widget_composition_guide/auth/signup/signup_page_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';

/// Page de cadastro que implementa padrão MVVM e Composition Pattern.
///
/// Toda a lógica do MVVM/MVP/MVC/BLoC entra aqui na **Page**.
/// Esta é a PÁGINA inteira - representa uma funcionalidade completa do app.
/// Contém TODA a lógica e estado necessário para o cadastro de usuário.
///
/// ## Características de uma Page:
/// - **Funcionalidade completa:** Cadastro do início ao fim
/// - **Estado específico:** Aceitação de termos, validações
/// - **Lógica de negócio:** Validação, submissão, feedback
/// - **Composição:** Usa componentes reutilizáveis (AuthForm)
///
/// ## Diferença para Screen:
/// - Page não conhece outras funcionalidades (não sabe sobre Login)
/// - Screen coordena múltiplas Pages (AuthScreen conhece Login + SignUp)
class SignUpPage extends StatefulWidget {
  /// Cria uma página de cadastro de usuário.
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageView();
}

/// View da SignUp Page responsável apenas pela apresentação visual.
///
/// Exemplo da diferença entre Page e View - todo componente possui uma View,
/// seja ele uma página, um botão, um formulário, etc.
///
/// ## Responsabilidades da View:
/// - **Renderização:** Constrói a interface usando componentes
/// - **Binding:** Conecta dados do ViewModel com widgets
/// - **Eventos:** Delega ações para o ViewModel
/// - **Validação visual:** Mostra feedback de erro para usuário
///
/// ## Composition Pattern na Prática:
/// Injeta campos específicos do cadastro no AuthForm reutilizável:
/// 1. Confirmação de senha (segurança)
/// 2. Nome completo (informação pessoal)
/// 3. Checkbox de termos (validação legal)
class _SignUpPageView extends SignUpPageViewModel {
  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Cadastro',
      buttonLabel: 'Criar Conta',

      // Lógica de submissão específica do cadastro
      onButtonSubmit: () {
        // Validação específica: termos devem ser aceitos
        if (!acceptTerms) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Você deve aceitar os termos para continuar'),
            ),
          );
          return;
        }

        // Lógica de cadastro vai aqui...
        // TODO: Implementar integração com API de cadastro
        debugPrint('Conta criada com sucesso!');
      },

      // COMPOSITION PATTERN: Aqui injetamos os campos extras específicos do cadastro
      // O AuthForm base já tem Email + Senha, aqui adicionamos o que é específico
      extraFields: [
        // Campo específico: confirmação de senha para segurança
        const AppTextField(
          label: 'Confirmar Senha',
          isPassword: true,
        ),

        // Campo específico: nome completo para informações pessoais
        const AppTextField(
          label: 'Nome Completo',
        ),

        // Componente específico: checkbox de aceite de termos legais
        _TermsCheckbox(
          acceptTerms: acceptTerms,
          onChanged: (value) => setState(() => acceptTerms = value),
        ),
      ],
    );
  }
}

/// Checkbox de aceite de termos específico para cadastro.
///
/// Componente stateless que recebe estado via callback pattern,
/// seguindo princípios de composição e responsabilidade única.
///
/// ## Design Pattern:
/// - **Controlled Component:** Estado gerenciado pelo pai
/// - **Callback Pattern:** Notifica mudanças via onChanged
/// - **Single Responsibility:** Apenas UI do checkbox
///
/// ## Acessibilidade:
/// - Texto clicável além do checkbox
/// - Adequado para uso com screen readers
/// - Área de toque expandida para melhor UX
///
/// ## UX Considerations:
/// - Checkbox + texto clicável (área maior de interação)
/// - Padding adequado para touch targets
/// - Texto explicativo claro sobre termos
class _TermsCheckbox extends StatelessWidget {
  /// Estado atual do checkbox (aceito/não aceito).
  final bool acceptTerms;

  /// Callback executado quando o estado muda.
  ///
  /// Permite que o componente pai (SignUpPageView) gerencie o estado.
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
