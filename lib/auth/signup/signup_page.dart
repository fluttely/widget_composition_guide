import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: 'Cadastro',
      buttonLabel: 'Criar Conta',
      onSubmit: () {
        // Lógica de cadastro vai aqui...
        debugPrint('Conta criada!');
      },
      // Aqui passamos os campos extras que o cadastro precisa!
      extraFields: const [
        AppTextField(label: 'Confirmar Senha', isPassword: true),
        AppTextField(label: 'Nome Completo'),
      ],
    );
  }
}
