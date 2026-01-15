import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';

enum CurrentPageType {
  login,
  signup,
}

abstract class AuthScreenViewModel extends State<AuthScreen> {
  late TextEditingController emailController;
  CurrentPageType currentPage = CurrentPageType.login;

  void switchAuthPage() => setState(
    () => currentPage = currentPage == CurrentPageType.login
        ? CurrentPageType.signup
        : CurrentPageType.login,
  );
}
