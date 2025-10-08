/// # App Elevated Button - Componente de Botão Reutilizável
///
/// Componente de botão customizado que encapsula o design system e
/// fornece uma interface consistente para botões elevados na aplicação.
///
/// ## Design System Integration:
/// - **Theme Tokens:** Usa AppTheme para border radius consistente
/// - **Material Design:** Baseado em ElevatedButton nativo
/// - **Customização:** Override de propriedades específicas da aplicação
///
/// ## Benefícios:
/// - **Consistência:** Todos os botões seguem o mesmo padrão visual
/// - **Manutenabilidade:** Mudanças no design refletem em toda aplicação
/// - **Flexibilidade:** Suporte a diferentes tamanhos e estados
/// - **Acessibilidade:** Herda comportamentos acessíveis do Material
///
/// ## Atomic Design:
/// Este é um componente **Atom** - elemento básico não decomponível
/// que pode ser usado para construir componentes mais complexos.
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// Botão elevado customizado seguindo o design system da aplicação.
///
/// Encapsula o [ElevatedButton] do Material Design com customizações
/// específicas da aplicação, como border radius dos design tokens.
///
/// ## Características:
/// - **Border Radius:** Usa token `theme.radius.small` (4px)
/// - **Full Width:** Configurável via parâmetro `fullWidth`
/// - **Estados:** Suporta enabled/disabled via `onPressed`
/// - **Acessibilidade:** Herda do ElevatedButton nativo
///
/// ## Exemplo de Uso:
/// ```dart
/// // Botão de largura total (padrão)
/// AppElevatedButton(
///   label: 'Entrar',
///   onPressed: () => handleLogin(),
/// )
///
/// // Botão com largura automática
/// AppElevatedButton(
///   label: 'Cancelar',
///   onPressed: () => Navigator.pop(context),
///   fullWidth: false,
/// )
///
/// // Botão desabilitado
/// AppElevatedButton(
///   label: 'Carregando...',
///   onPressed: null, // ← null desabilita o botão
/// )
/// ```
///
/// ## Design Tokens Aplicados:
/// - **Border Radius:** `theme.radius.small` (4px) - consistência visual
/// - **Shape:** RoundedRectangleBorder para cantos arredondados
/// - **Full Width:** SizedBox com `width: double.infinity` quando ativo
class AppElevatedButton extends StatelessWidget {
  /// Texto exibido no botão.
  ///
  /// Deve ser conciso e indicar claramente a ação que será executada.
  final String label;

  /// Callback executado quando o botão é pressionado.
  ///
  /// Quando `null`, o botão fica automaticamente desabilitado.
  /// Quando fornecido, o botão fica habilitado e responsivo.
  final VoidCallback? onPressed;

  /// Controla se o botão ocupa toda a largura disponível.
  ///
  /// **Valores:**
  /// - `true` (padrão) - Botão ocupa toda largura (double.infinity)
  /// - `false` - Botão tem largura automática baseada no conteúdo
  ///
  /// **Uso recomendado:**
  /// - `true` para botões primários (submit, login, etc)
  /// - `false` para botões secundários (cancel, link, etc)
  final bool fullWidth;

  /// Cria um botão elevado com design system aplicado.
  ///
  /// [label] - Texto do botão (obrigatório)
  /// [onPressed] - Callback de ação (null = desabilitado)
  /// [fullWidth] - Largura total ou automática (padrão: true)
  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    // Acessa design tokens via AppTheme
    final theme = AppTheme.of(context);
    final smallRadius = theme.radius.small;

    // Cria botão base com customizações do design system
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Aplica border radius do design token
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(smallRadius),
        ),
        // Adiciona padding padrão para melhor touch target
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
      child: Text(label),
    );

    // Conditional wrapper: full width ou largura automática
    return fullWidth
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}
