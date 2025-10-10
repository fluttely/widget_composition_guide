/// **Widget Composition Guide**
/// • MVVM + Design Tokens + Composite Pattern
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';
import 'package:widget_composition_guide/design_system/theme/app_design_system.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppRoot());
}

/// **App Root:** AppDesignSystem → MaterialApp → AuthScreen
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDesignSystem(
      // debugIsOn: true,
      child: MaterialApp(
        title: 'Widget Composition Guide',
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const AuthScreen(),
      ),
    );
  }
}
