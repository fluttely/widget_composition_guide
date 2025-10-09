/// **Widget Composition Guide**
/// • MVVM + Design Tokens + Composition Pattern
/// • Flutter nativo, Material 2, InheritedWidget
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// Inicializa o framework Flutter e executa a aplicação principal.
///
/// Configura o binding de widgets e inicia a árvore de widgets raiz.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

/// **App Root Widget**
/// • AppTheme (Design System) → MaterialApp → AuthScreen
class App extends StatelessWidget {
  /// Cria uma instância do widget principal da aplicação.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      // debugIsOn: true, // Descomente para ativar debug visual
      child: MaterialApp(
        title: 'Widget Composition Guide',

        // Usando Material 2 para facilitar a visualização dos componentes
        // sem configurações complexas de tema
        darkTheme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark(primary: Colors.red),
        ),
        themeMode: ThemeMode.dark,

        // Tela inicial - módulo de autenticação
        home: const AuthScreen(),
      ),
    );
  }
}
