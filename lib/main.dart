import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget Composition Guide',
      home: AuthScreen(),
    );
  }
}
