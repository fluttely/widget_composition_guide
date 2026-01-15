import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';

abstract class SignUpPageViewModel extends State<SignUpPage> {
  bool acceptTerms = false;

  void submit() {
    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você deve aceitar os termos para se autenticar.'),
        ),
      );
      return;
    }
    debugPrint('Conta criada com sucesso!');
  }
}
