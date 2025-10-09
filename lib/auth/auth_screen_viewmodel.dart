/// • MVVM: login ↔ signup toggle • switchAuthPage()
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';

abstract class AuthScreenViewModel extends State<AuthScreen> {
  String currentPage = 'login';

  void switchAuthPage() =>
      setState(() => currentPage = currentPage == 'login' ? 'signup' : 'login');
}
