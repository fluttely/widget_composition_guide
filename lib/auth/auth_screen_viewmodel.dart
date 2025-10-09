/// **AuthScreenViewModel - Navegação Logic**
/// • MVVM: gerencia estado de navegação (login/signup)
/// • switchAuthPage(): toggle entre páginas
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';

/// **Abstract Class Pattern - ViewModel Base**
/// • Estende State<AuthScreen> para acesso a setState
/// • Define contrato que View deve seguir
abstract class AuthScreenViewModel extends State<AuthScreen> {
  /// 'login' | 'signup' - estado da navegação
  String currentPage = 'login';

  /// **Toggle Logic + setState**
  /// • login ↔ signup, dispara rebuild da View
  void switchAuthPage() {
    setState(() {
      currentPage = currentPage == 'login' ? 'signup' : 'login';
    });
  }
}
