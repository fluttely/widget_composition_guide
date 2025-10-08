/// # Auth Screen ViewModel - Lógica de Negócio da Navegação
///
/// ViewModel responsável pelo gerenciamento de estado e lógica de negócio
/// da navegação entre Login e SignUp no módulo de autenticação.
///
/// ## Padrão MVVM:
/// Este ViewModel segue o padrão MVVM (Model-View-ViewModel) onde:
/// - **Model:** String currentPage (representa o estado)
/// - **View:** _AuthScreenView (consome este ViewModel)
/// - **ViewModel:** Esta classe (contém lógica e estado)
///
/// ## Responsabilidades:
/// - **Estado:** Gerencia qual página está ativa ('login' ou 'signup')
/// - **Navegação:** Controla transição entre funcionalidades
/// - **Lógica:** Encapsula regras de negócio da navegação
///
/// ## Benefícios da Separação:
/// - **Testabilidade:** Lógica pode ser testada independentemente da UI
/// - **Reutilização:** ViewModel pode ser usado por diferentes Views
/// - **Manutenibilidade:** Mudanças na lógica não afetam a apresentação
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';

/// ViewModel abstrato que encapsula a lógica de navegação do AuthScreen.
///
/// Estende [State<AuthScreen>] para ter acesso ao ciclo de vida do widget
/// e poder chamar [setState] para atualizar a UI quando o estado muda.
///
/// ## Padrão Abstract Class:
/// Utiliza classe abstrata para definir um contrato que a View deve seguir,
/// permitindo que diferentes implementações de View consumam a mesma lógica.
///
/// ## Estado Gerenciado:
/// - [currentPage] - Página atual ('login' ou 'signup')
///
/// ## Métodos Públicos:
/// - [switchAuthPage] - Alterna entre páginas de login e signup
///
/// ## Exemplo de Uso:
/// ```dart
/// class _AuthScreenView extends AuthScreenViewModel {
///   @override
///   Widget build(BuildContext context) {
///     return currentPage == 'login'
///       ? LoginPage()
///       : SignUpPage();
///   }
/// }
/// ```
abstract class AuthScreenViewModel extends State<AuthScreen> {
  /// Estado atual da navegação entre páginas de autenticação.
  ///
  /// **Valores possíveis:**
  /// - `'login'` - Exibe a página de login
  /// - `'signup'` - Exibe a página de cadastro
  ///
  /// **Estado inicial:** `'login'` (usuários começam tentando fazer login)
  String currentPage = 'login';

  /// Alterna entre as páginas de login e signup.
  ///
  /// Implementa a lógica de toggle entre os dois estados possíveis,
  /// atualizando a UI através de [setState].
  ///
  /// ## Lógica de Negócio:
  /// - Se está em 'login' → muda para 'signup'
  /// - Se está em 'signup' → muda para 'login'
  ///
  /// ## Side Effects:
  /// - Chama [setState] para atualizar a UI
  /// - Dispara rebuild da View com nova página
  ///
  /// ## Uso na View:
  /// ```dart
  /// AppTextButton(
  ///   onPressed: switchAuthPage, // ← Callback direto
  ///   label: currentPage == 'login' ? 'Criar Conta' : 'Entrar',
  /// )
  /// ```
  void switchAuthPage() {
    setState(() {
      currentPage = currentPage == 'login' ? 'signup' : 'login';
    });
  }
}
