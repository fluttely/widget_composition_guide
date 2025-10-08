import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Login',
      buttonText: 'Entrar',
      onSubmit: () {
        // Lógica de login vai aqui...
        debugPrint('Login efetuado!');
      },
      // Para o login, não temos campos extras.
      extraFields: const [], // Passamos uma lista vazia!
    );
  }
}
