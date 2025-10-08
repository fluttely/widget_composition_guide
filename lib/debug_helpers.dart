import 'package:flutter/material.dart';
import 'package:widget_composition_guide/design_system/theme/app_theme.dart';

class DebugColors {
  static const imageArea = Colors.pink;
  static const formArea = Colors.yellow;
  static const buttonArea = Colors.orange;
}

class DebugContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const DebugContainer({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final debugIsOn = theme.debugIsOn;

    return Container(
      color: debugIsOn ? color : Colors.transparent,
      child: child,
    );
  }
}
