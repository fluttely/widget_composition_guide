/// **LoginPage - Simplicidade via Composition**
/// • AuthForm + extraFields: [] (apenas Email + Senha)
/// • StatelessWidget: sem estado próprio
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

/// **Exemplo de Page Minimalista**
/// • Composition: AuthForm + campos base apenas
/// • extraFields: [] = Email + Senha + Botão
class LoginPage extends StatelessWidget {
  /// Cria uma página de login de usuário.
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Login',
      buttonLabel: 'Entrar',

      // Callback específico do login
      onButtonSubmit: () {
        // TODO: API integration, token storage, navigation
        debugPrint('Login efetuado com sucesso!');
      },

      // COMPOSITION: lista vazia = apenas campos base
      extraFields: const [], // ← Lista vazia = apenas campos base!
    );
  }
}
