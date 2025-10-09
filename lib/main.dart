/// **Widget Composition Guide**
/// • MVVM + Design Tokens + Composition Pattern
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppDesignSystem(
      darkTheme: darkTheme,
      child: const App(),
    ),
  );
}

/// **App Root:** AppDesignSystem → MaterialApp → AuthScreen
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = AppDesignSystem.of(context).darkTheme;

    return MaterialApp(
      title: 'Widget Composition Guide',
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const AuthScreen(),
    );
  }
}
