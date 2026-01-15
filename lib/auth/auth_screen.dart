/// **AuthScreen - Screen Coordinator**
/// • Coordena Login + SignUp • MVVM pattern
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen_viewmodel.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';
import 'package:widget_composition_guide/debug_helpers.dart';
import 'package:widget_composition_guide/design_system/components/app_text_button.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';

/// **Screen vs Page vs View:** Screen coordena, Page especializa, View apresenta
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenView();
}

/// **View:** renderização condicional + DebugContainer
class _AuthScreenView extends AuthScreenViewModel {
  @override
  Widget build(BuildContext context) {
    final spacing = AppDesignSystem.of(context).spacing;

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: Padding(
        padding: EdgeInsets.all(spacing.screen),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing.content,
            children: <Widget>[
              DebugContainer(
                color: DebugColors.imageArea,
                child: Padding(
                  padding: EdgeInsets.all(spacing.logo),
                  child: Image.asset(
                    'assets/fluttely_logo_bg_transparent.png',
                    height: 200,
                  ),
                ),
              ),

              // Conditional rendering
              DebugContainer(
                color: DebugColors.formArea,
                child: currentPage == CurrentPageType.login
                    // SRP (Single Responsibility Principle)
                    ? const LoginPage()
                    : const SignUpPage(),
              ),

              DebugContainer(
                color: DebugColors.buttonArea,
                child: AppTextButton(
                  onPressed: switchAuthPage,
                  labelText: currentPage == CurrentPageType.login
                      ? 'Criar conta'
                      : 'Já possuo uma conta',
                  fullWidth: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
