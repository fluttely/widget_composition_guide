import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      debugIsOn: true,
      child: MaterialApp(
        title: 'Widget Composition Guide',
        // usando material 2 para facilitar a visualização dos componentes da tela com pouca configuração
        theme: ThemeData(useMaterial3: false),
        home: AuthScreen(),
      ),
    );
  }
}
