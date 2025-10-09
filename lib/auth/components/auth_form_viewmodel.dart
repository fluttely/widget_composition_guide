/// **AuthFormViewModel - Loading Logic**
/// • isLoading state + async/await simulation
/// • handleSubmit: loading → callback → cleanup
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

/// **Abstract ViewModel - Loading Management**
/// • isLoading: bool state
/// • handleSubmit: async simulation + callback execution
abstract class AuthFormViewModel extends State<AuthForm> {
  /// false = normal, true = loading indicator
  bool isLoading = false;

  /// **Async Submit Pattern**
  /// • loading → delay(2s) → callback → cleanup
  /// • try/catch/finally com mounted check
  Future<void> handleSubmit() async {
    setState(() => isLoading = true);

    try {
      // Simula operação async (API call em produção)
      await Future.delayed(const Duration(seconds: 2));

      // Executa callback específico da Page (login/signup)
      widget.onButtonSubmit();
    } catch (e) {
      // Error handling para produção
      debugPrint('Erro ao submeter formulário: $e');
    } finally {
      // Cleanup: remove loading + mounted check
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}
