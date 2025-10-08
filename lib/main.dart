/// # Widget Composition Guide - Flutter
///
/// Aplicação de demonstração que implementa padrões arquiteturais e boas práticas
/// para desenvolvimento Flutter, com foco em componentização robusta vs simplicidade.
///
/// ## Características Principais:
/// - **Arquitetura:** MVVM (Model-View-ViewModel)
/// - **Design System:** Token-based com InheritedWidget
/// - **Composição:** Composition Pattern para reutilização
/// - **Estado:** StatefulWidget + ViewModel pattern
///
/// ## Tecnologias:
/// - Flutter nativo (sem packages externos)
/// - Material Design 2 (para simplicidade)
/// - InheritedWidget para theme injection
///
/// **Autor:** Widget Composition Guide Project
/// **Propósito:** Demonstração técnica e educacional
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

/// Widget raiz da aplicação que configura o tema e a navegação inicial.
///
/// ## Responsabilidades:
/// - Configuração do [AppTheme] personalizado
/// - Setup do [MaterialApp] com tema escuro
/// - Definição da tela inicial ([AuthScreen])
///
/// ## Configurações:
/// - **Material Design:** Versão 2 para simplicidade
/// - **Tema:** Modo escuro por padrão
/// - **Background:** Scaffold com fundo preto
///
/// ## Arquitetura:
/// ```
/// App (Root)
/// └── AppTheme (Design System)
///     └── MaterialApp (Flutter Framework)
///         └── AuthScreen (Feature Module)
/// ```
class App extends StatelessWidget {
  /// Cria uma instância do widget principal da aplicação.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      debugIsOn: true, // Descomente para ativar debug visual
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
