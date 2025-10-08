/// # Auth Form - Componente Reutilizável de Formulário
///
/// Componente de formulário de autenticação que implementa o **Composition Pattern**
/// para máxima reutilização entre diferentes páginas (Login e SignUp).
///
/// ## Padrão Composition:
/// Aceita `extraFields` como parâmetro, permitindo que páginas diferentes
/// injetem campos específicos sem duplicar a estrutura base do formulário.
///
/// ## Benefícios:
/// - **Reutilização:** Mesmo componente para Login e SignUp
/// - **Flexibilidade:** Campos dinâmicos via composition
/// - **Consistência:** UI padronizada entre diferentes usos
/// - **Manutenção:** Mudanças na estrutura refletem em todos os usos
///
/// ## Arquitetura MVVM:
/// ```
/// AuthForm (StatefulWidget) ← Composition Root
/// ├── _AuthFormView (View - Presentation)
/// └── AuthFormViewModel (ViewModel - Logic)
///     ├── Loading State Management
///     └── Form Submission Logic
/// ```
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form_viewmodel.dart';
import 'package:widget_composition_guide/design_system/app_button.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// Formulário de autenticação reutilizável que implementa Composition Pattern.
///
/// Este componente demonstra como criar widgets altamente reutilizáveis
/// através de composition, permitindo que diferentes páginas injetem
/// campos específicos sem duplicar código.
///
/// ## Composition Pattern:
/// ```dart
/// // Login: sem campos extras
/// AuthForm(
///   buttonLabel: 'Entrar',
///   onButtonSubmit: handleLogin,
///   extraFields: [], // ← Vazio
/// )
///
/// // SignUp: com campos extras
/// AuthForm(
///   buttonLabel: 'Criar Conta',
///   onButtonSubmit: handleSignUp,
///   extraFields: [        // ← Campos específicos
///     AppTextField(label: 'Nome Completo'),
///     TermsCheckbox(),
///   ],
/// )
/// ```
///
/// ## Estrutura Base:
/// Sempre inclui os campos fundamentais de autenticação:
/// 1. Campo de Email
/// 2. Campo de Senha
/// 3. Campos extras (via composition)
/// 4. Botão de submissão com loading state
class AuthForm extends StatefulWidget {
  /// Título do formulário (não usado atualmente, preparado para futuro).
  final String title;

  /// Texto do botão de submissão ('Entrar', 'Criar Conta', etc).
  final String buttonLabel;

  /// Callback executado quando o formulário é submetido.
  ///
  /// A lógica específica de cada página (login/signup) é injetada aqui.
  final VoidCallback onButtonSubmit;

  /// **A MÁGICA ACONTECE AQUI!**
  ///
  /// Lista de widgets extras que serão injetados no formulário.
  /// Permite que diferentes páginas adicionem campos específicos
  /// sem duplicar a estrutura base do formulário.
  ///
  /// ## Exemplos de Extra Fields:
  /// - Confirmação de senha (SignUp)
  /// - Nome completo (SignUp)
  /// - Checkbox de termos (SignUp)
  /// - Campos de perfil específicos
  final List<Widget> extraFields;

  /// Cria um formulário de autenticação com composition de campos.
  ///
  /// [title] - Título do formulário (futuro uso)
  /// [buttonLabel] - Texto do botão de submissão
  /// [onButtonSubmit] - Callback para lógica específica da página
  /// [extraFields] - Campos adicionais específicos da página
  const AuthForm({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onButtonSubmit,
    this.extraFields = const [], // Valor padrão é lista vazia
  });

  @override
  State<AuthForm> createState() => _AuthFormView();
}

/// View do Auth Form responsável apenas pela apresentação visual.
///
/// Exemplo da diferença entre Page e View - todo componente possui uma View,
/// seja ele uma página, um botão, um formulário, etc.
///
/// ## Responsabilidades da View:
/// - **Layout:** Organizar campos usando design tokens
/// - **Rendering:** Renderizar campos base + campos extras
/// - **Binding:** Conectar estado do ViewModel com UI
///
/// ## Estrutura Visual:
/// 1. Campos base (Email + Senha)
/// 2. Campos extras (via spread operator)
/// 3. Espaçamento (usando design tokens)
/// 4. Botão com estado de loading
class _AuthFormView extends AuthFormViewModel {
  @override
  Widget build(BuildContext context) {
    // Acessa design tokens via AppTheme
    final theme = AppTheme.of(context);
    final smallSpacing = theme.spacing.small;
    final largeSpacing = theme.spacing.large;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: smallSpacing,
      children: [
        // Campos que SEMPRE existem em qualquer formulário de auth
        const AppTextField(label: 'Email'),
        const AppTextField(label: 'Senha', isPassword: true),

        // Campos EXTRAS que podem ou não existir (Composition Pattern)
        // O spread operator (...) "desempacota" a lista de widgets
        ...widget.extraFields,

        SizedBox(height: largeSpacing),

        // Botão com loading state gerenciado pelo ViewModel
        _Button(
          label: widget.buttonLabel,
          onPressed: isLoading ? () {} : handleSubmit,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

/// Botão interno do formulário com estado de loading integrado.
///
/// **Decisão arquitetural:** Componente privado pois é usado apenas neste contexto.
/// Se fosse reutilizado em múltiplos locais, seria promovido para widget público
/// em um novo arquivo.
///
/// ## Estados:
/// - **Normal:** Exibe botão com texto
/// - **Loading:** Exibe CircularProgressIndicator
///
/// ## Props:
/// - [label] - Texto do botão
/// - [onPressed] - Callback (null quando loading)
/// - [isLoading] - Estado de carregamento
class _Button extends StatelessWidget {
  /// Texto exibido no botão.
  final String label;

  /// Callback executado ao pressionar o botão.
  ///
  /// Pode ser null para desabilitar o botão durante loading.
  final VoidCallback? onPressed;

  /// Estado de loading que controla a apresentação do botão.
  final bool isLoading;

  /// Cria um botão com estado de loading integrado.
  const _Button({
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = AppTheme.of(context).sizes.buttonHeight;

    return isLoading
        ? Center(
            child: SizedBox(
              height: buttonHeight,
              width: buttonHeight,
              child: CircularProgressIndicator(),
            ),
          )
        : AppElevatedButton(
            onPressed: onPressed,
            label: label,
            fullWidth: true,
          );
  }
}
