/// **AuthScreen - Screen Coordinator**
/// • Coordena Login + SignUp pages
/// • MVVM: Screen → View → ViewModel
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen_viewmodel.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';
import 'package:widget_composition_guide/debug_helpers.dart';
import 'package:widget_composition_guide/design_system/components/app_text_button.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Screen vs Page vs View:**
/// • Screen: coordena múltiplas Pages
/// • Page: funcionalidade específica
/// • View: apenas apresentação
class AuthScreen extends StatefulWidget {
  /// Cria uma instância do Screen de autenticação.
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenView();
}

/// **View - Apenas Apresentação**
/// • Estende ViewModel para acesso à lógica
/// • Renderização condicional: currentPage == 'login' ? LoginPage : SignUpPage
/// • DebugContainer para identificação visual de áreas
class _AuthScreenView extends AuthScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Design tokens + layout estrutural
    final theme = AppTheme.of(context);
    final largeSpacing = theme.spacing.large;
    final extraLargeSpacing = theme.spacing.extraLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(extraLargeSpacing),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: largeSpacing,
            children: <Widget>[
              // Imagem/Logo - Debug: Blue
              DebugContainer(
                color: DebugColors.imageArea,
                child: Image.asset('assets/nasa_logo.png'),
              ),

              SizedBox(height: extraLargeSpacing),

              // Formulário Condicional - Debug: Purple
              // currentPage state determina qual Page renderizar
              DebugContainer(
                color: DebugColors.formArea,
                child: currentPage == 'login'
                    ? const LoginPage()
                    : const SignUpPage(),
              ),

              // Botão Toggle - Debug: Yellow
              // Screen conhece ambas Pages, mas Pages não se conhecem (SRP)
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
