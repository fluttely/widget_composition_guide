import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';
import 'package:widget_composition_guide/debug_helpers.dart';
import 'package:widget_composition_guide/design_system/components/app_text_button.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _currentPage = 'login';

  void _switchAuthPage() {
    setState(() {
      _currentPage = _currentPage == 'login' ? 'signup' : 'login';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
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
            spacing: 16,
            children: <Widget>[
              DebugContainer(
                color: DebugColors.imageArea,
                child: const Text('Image here'),
              ),
              DebugContainer(
                color: DebugColors.formArea,
                child: _currentPage == 'login'
                    ? const LoginPage()
                    : const SignUpPage(),
              ),
              // esse botão esta do lado de fora de LoginPage e SignUpPage pois ele conhece ambas as paginas, mas elas nao devem conhecer uma a outra
              DebugContainer(
                color: DebugColors.buttonArea,
                child: AppTextButton(
                  onPressed: _switchAuthPage,
                  label: _currentPage == 'login' ? 'create account' : 'login',
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
