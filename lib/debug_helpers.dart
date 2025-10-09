/// **Debug Helpers - Ferramentas Visuais**
/// • DebugContainer: overlay colorido quando AppDesignSystem.debugIsOn = true
/// • DebugColors: Blue (image), Purple (form), Yellow (button)
import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

/// **Debug Colors - Paleta para Identificação**
/// • Blue: áreas de imagem/mídia
/// • Purple: formulários/inputs
/// • Yellow: botões/ações
class DebugColors {
  /// Azul - imagens/mídia
  static const Color imageArea = Colors.blue;

  /// Roxo - formulários/inputs
  static const Color formArea = Colors.purple;

  /// Amarelo - botões/ações
  static const Color buttonArea = Colors.yellow;
}

/// **DebugContainer - Overlay Condicional**
/// • Cor quando debugIsOn = true, transparente quando false
/// • Usado para identificar áreas de layout visualmente
class DebugContainer extends StatelessWidget {
  /// Cor de overlay (use DebugColors)
  final Color color;

  /// Widget filho envolvido pelo debug container
  final Widget? child;

  /// Cria um container de debug com cor e widget filho especificados.
  const DebugContainer({
    super.key,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final debugIsOn = AppDesignSystem.of(context).debugIsOn;

    return Container(
      // Conditional rendering: cor quando debug ativo, transparente caso contrário
      color: debugIsOn ? color : Colors.transparent,
      child: child,
    );
  }
}
