/// **AuthForm - Composition Pattern**
/// • Formulário base (Email + Senha) + extraFields dinâmicos
/// • MVVM + Loading state management
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/components/auth_form_viewmodel.dart';
import 'package:widget_composition_guide/design_system/components/app_elevated_button.dart';
import 'package:widget_composition_guide/design_system/components/app_text_field.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Composition Pattern - A MÁGICA:**
/// • extraFields: List<Widget> = campos específicos de cada Page
/// • Login: extraFields = [] (só Email + Senha)
/// • SignUp: extraFields = [ConfirmSenha, Nome, Termos]
class AuthForm extends StatefulWidget {
  /// Título do formulário (não usado atualmente, preparado para futuro).
  final String title;

  /// Texto do botão de submissão ('Entrar', 'Criar Conta', etc).
  final String buttonLabel;

  /// Callback executado quando o formulário é submetido.
  ///
  /// A lógica específica de cada página (login/signup) é injetada aqui.
  final VoidCallback onButtonSubmit;

  /// **COMPOSITION CORE - extraFields**
  /// Lista de widgets específicos injetados por cada Page
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

/// **View - Layout + Binding**
/// • Campos base + ...extraFields (spread operator)
/// • Loading state binding do ViewModel
class _AuthFormView extends AuthFormViewModel {
  @override
  Widget build(BuildContext context) {
    // Design tokens para espaçamento consistente
    final theme = AppTheme.of(context);
    final smallSpacing = theme.spacing.small;
    final largeSpacing = theme.spacing.large;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: smallSpacing,
      children: [
        // Campos base: sempre presentes
        const AppTextField(label: 'Email'),
        const AppTextField(label: 'Senha', isPassword: true),

        // COMPOSITION: campos específicos via spread operator
        ...widget.extraFields,

        SizedBox(height: largeSpacing),

        // Botão com loading state (ViewModel)
        _Button(
          label: widget.buttonLabel,
          onPressed: isLoading ? () {} : handleSubmit,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

/// **Botão Interno - Loading States**
/// • Normal: AppElevatedButton
/// • Loading: CircularProgressIndicator
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
