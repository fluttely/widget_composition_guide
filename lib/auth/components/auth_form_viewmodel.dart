/// **AuthFormViewModel - Loading State**
/// • isLoading + async simulation • handleSubmit pattern
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

/// **Async Pattern:** try/catch/finally + mounted check
abstract class AuthFormViewModel extends State<AuthForm> {
  bool isLoading = false;

  Future<void> handleSubmit() async {
    setState(() => isLoading = true);

    try {
      await Future.delayed(const Duration(seconds: 2));
      widget.onButtonSubmit.call();
    } catch (e) {
      debugPrint('Erro ao submeter formulário: $e');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }
}
