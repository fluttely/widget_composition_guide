import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Login',
      buttonLabel: 'Entrar',
      onButtonSubmit: () => debugPrint('Login efetuado com sucesso!'),

      // COMPOSITION: lista vazia = apenas campos base!
      extraFields: [],
    );
  }
}
