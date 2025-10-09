/// **AuthScreen - Screen Coordinator**
/// • Coordena Login + SignUp • MVVM pattern
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen_viewmodel.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';
import 'package:widget_composition_guide/debug_helpers.dart';
import 'package:widget_composition_guide/design_system/components/app_text_button.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Screen → Page → View:** Screen coordena, Page especializa, View apresenta
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenView();
}

/// **View:** renderização condicional + DebugContainer
class _AuthScreenView extends AuthScreenViewModel {
  @override
  Widget build(BuildContext context) {
    final theme = AppDesignSystem.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: Padding(
        padding: EdgeInsets.all(theme.spacing.extraLarge),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: theme.spacing.large,
            children: <Widget>[
              DebugContainer(
                color: DebugColors.imageArea,
                child: Image.asset('assets/nasa_logo.png'),
              ),

              SizedBox(height: theme.spacing.large),

              // Conditional rendering
              DebugContainer(
                color: DebugColors.formArea,
                child: currentPage == 'login'
                    ? const LoginPage()
                    : const SignUpPage(),
              ),

              // Screen conhece ambas Pages (SRP)
              DebugContainer(
                color: DebugColors.buttonArea,
                child: AppTextButton(
                  onPressed: switchAuthPage,
                  label: currentPage == 'login' ? 'Criar Conta' : 'Entrar',
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
