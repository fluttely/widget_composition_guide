/// # Auth Screen - Coordenador de Autenticação
///
/// Screen principal do módulo de autenticação que coordena a navegação
/// entre as funcionalidades de Login e SignUp usando padrão MVVM.
///
/// ## Responsabilidades:
/// - **Coordenação:** Gerencia transição entre Login/SignUp
/// - **Navegação:** Controla qual página está ativa
/// - **Layout:** Estrutura visual geral do módulo de autenticação
///
/// ## Padrão MVVM:
/// - **Model:** Estado da navegação (currentPage)
/// - **View:** _AuthScreenView (apresentação)
/// - **ViewModel:** AuthScreenViewModel (lógica de negócio)
///
/// ## Arquitetura:
/// ```
/// AuthScreen (StatefulWidget)
/// ├── _AuthScreenView (View - UI)
/// └── AuthScreenViewModel (ViewModel - Logic)
///     ├── LoginPage (quando currentPage = 'login')
///     └── SignUpPage (quando currentPage = 'signup')
/// ```
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/auth_screen_viewmodel.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';
import 'package:widget_composition_guide/debug_helpers.dart';
import 'package:widget_composition_guide/design_system/components/app_text_button.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// Widget Screen que representa o módulo completo de autenticação.
///
/// Um **Screen** é um coordenador de alto nível que conhece múltiplas **Pages**
/// e gerencia a navegação entre elas. Diferente de uma Page, um Screen pode
/// ter conhecimento de diferentes funcionalidades do mesmo módulo.
///
/// ## Diferenças Arquiteturais:
/// - **Screen:** Coordena múltiplas Pages, conhece o fluxo completo
/// - **Page:** Funcionalidade específica, conhece apenas sua responsabilidade
/// - **View:** Apenas apresentação, não possui lógica de negócio
///
/// ## Estado Gerenciado:
/// - Página atual (login/signup)
/// - Transição entre funcionalidades
/// - Layout e estrutura visual
class AuthScreen extends StatefulWidget {
  /// Cria uma instância do Screen de autenticação.
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenView();
}

/// View do Auth Screen responsável apenas pela apresentação visual.
///
/// Estende [AuthScreenViewModel] para acessar a lógica de negócio e estado.
/// Segue o padrão MVVM onde a View não contém lógica, apenas renderização.
///
/// ## Responsabilidades da View:
/// - **Renderização:** Construir a interface visual
/// - **Layout:** Organizar componentes na tela
/// - **Binding:** Conectar dados do ViewModel com widgets
///
/// ## Estrutura Visual:
/// 1. **Header:** Logo/Imagem da aplicação
/// 2. **Content:** Página atual (Login ou SignUp)
/// 3. **Footer:** Botão para alternar entre páginas
///
/// ## Debug Visual:
/// Utiliza [DebugContainer] para identificar diferentes áreas:
/// - **Blue:** Área de imagem/logo
/// - **Purple:** Área do formulário
/// - **Yellow:** Área de botões de ação
class _AuthScreenView extends AuthScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Acessa tokens do design system via AppTheme
    final theme = AppTheme.of(context);
    final mediumSpacing = theme.spacing.medium;
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
            spacing: mediumSpacing,
            children: <Widget>[
              // Área de Imagem/Logo - Debug: Blue
              DebugContainer(
                color: DebugColors.imageArea,
                child: Image.asset('assets/nasa_logo.png'),
              ),

              SizedBox(height: extraLargeSpacing),

              // Área do Formulário - Debug: Purple
              // Renderização condicional baseada no estado do ViewModel
              DebugContainer(
                color: DebugColors.formArea,
                child: currentPage == 'login'
                    ? const LoginPage()
                    : const SignUpPage(),
              ),

              // Área de Botão de Navegação - Debug: Yellow
              // Este botão fica fora das Pages pois ele conhece ambas,
              // mas as Pages não devem conhecer uma à outra (SRP - Single Responsibility)
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
