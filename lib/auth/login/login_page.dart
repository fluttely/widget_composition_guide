/// # Login Page - Página de Autenticação de Usuário
///
/// Page específica para funcionalidade de login que demonstra
/// simplicidade e reutilização através do Composition Pattern.
///
/// ## Responsabilidades da Page:
/// - **Funcionalidade específica:** Apenas autenticação de usuário
/// - **Simplicidade:** Não possui estado local (StatelessWidget)
/// - **Reutilização:** Usa AuthForm sem campos extras
/// - **Lógica mínima:** Apenas callback de sucesso
///
/// ## Composition Pattern Demonstrado:
/// Esta page é o exemplo perfeito de como o Composition Pattern
/// permite reutilização máxima:
/// - **AuthForm base:** Email + Senha + Botão
/// - **Extra fields:** Lista vazia (não precisa de campos extras)
/// - **Resultado:** Login funcional com zero duplicação de código
///
/// ## Comparação com SignUpPage:
/// - **Login:** AuthForm + extraFields: []
/// - **SignUp:** AuthForm + extraFields: [confirmSenha, nome, termos]
/// - **Benefício:** Mesmo componente, diferentes especializações
///
/// ## Diferenças Arquiteturais:
/// - **Screen:** Coordena múltiplas Pages (AuthScreen)
/// - **Page:** Funcionalidade específica (LoginPage)
/// - **Component:** Reutilizável (AuthForm)
/// - **Atom:** Elemento básico (AppTextField, AppElevatedButton)
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

/// Page de login que demonstra simplicidade através de composition.
///
/// Esta é uma **Page StatelessWidget** - não precisa de estado próprio
/// pois toda complexidade de loading e validação está encapsulada
/// no AuthForm reutilizável.
///
/// ## Characteristics de uma Page Simples:
/// - **Stateless:** Não gerencia estado próprio
/// - **Composição:** Usa componentes existentes
/// - **Callback:** Define comportamento específico via onButtonSubmit
/// - **Minimalista:** Código mínimo para máxima funcionalidade
///
/// ## Composition Pattern na Prática:
/// ```dart
/// // Login: AuthForm com campos base apenas
/// AuthForm(
///   extraFields: const [], // ← Lista vazia!
/// )
///
/// // SignUp: AuthForm com campos extras
/// AuthForm(
///   extraFields: [       // ← Campos específicos
///     ConfirmPasswordField(),
///     FullNameField(),
///     TermsCheckbox(),
///   ],
/// )
/// ```
///
/// ## Benefícios desta Abordagem:
/// - **Zero duplicação:** Reutiliza AuthForm completamente
/// - **Manutenção única:** Mudanças em AuthForm refletem no Login
/// - **Consistência:** UI e UX idênticos entre Login/SignUp
/// - **Simplicidade:** Código mínimo para funcionalidade completa
class LoginPage extends StatelessWidget {
  /// Cria uma página de login de usuário.
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Login',
      buttonLabel: 'Entrar',

      // Lógica específica do login - executada após loading
      onButtonSubmit: () {
        // TODO: Implementar integração com API de autenticação
        // - Validar credenciais com backend
        // - Armazenar token de autenticação
        // - Navegar para tela principal
        // - Tratar erros de login (credenciais inválidas, etc)

        debugPrint('Login efetuado com sucesso!');
      },

      // COMPOSITION PATTERN: Para login, não precisamos de campos extras
      // O AuthForm já fornece Email + Senha + Botão, que é suficiente
      extraFields: const [], // ← Lista vazia = apenas campos base!
    );
  }
}
