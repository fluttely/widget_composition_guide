/// **Widget Composition Guide**
/// • MVVM + Design Tokens + Composite Pattern
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppDesignSystem(
      // debugIsOn: true,
      darkTheme: darkTheme,
      child: const AppRoot(),
    ),
  );
}

/// **App Root:** AppDesignSystem → MaterialApp → AuthScreen
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

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
