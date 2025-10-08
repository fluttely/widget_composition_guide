/// # Auth Form ViewModel - Lógica de Estado de Loading
///
/// ViewModel responsável pelo gerenciamento de estado de loading e
/// submissão de formulários de autenticação.
///
/// ## Responsabilidades:
/// - **Loading State:** Gerencia estado de carregamento durante submissão
/// - **Async Operations:** Controla operações assíncronas (API calls)
/// - **Error Handling:** Tratamento de erros durante submissão
/// - **UI Feedback:** Fornece feedback visual para o usuário
///
/// ## Padrão MVVM:
/// - **Model:** Estado de loading (bool isLoading)
/// - **View:** _AuthFormView (consome este ViewModel)
/// - **ViewModel:** Esta classe (lógica de negócio)
///
/// ## Benefits:
/// - **Testabilidade:** Lógica separada da UI
/// - **Reutilização:** Pode ser usado por diferentes forms
/// - **Manutenibilidade:** Mudanças na lógica não afetam apresentação
import 'package:flutter/widgets.dart';
import 'package:widget_composition_guide/auth/components/auth_form.dart';

/// ViewModel abstrato que encapsula a lógica de loading e submissão do AuthForm.
///
/// Implementa o padrão async/await para operações de rede simuladas,
/// fornecendo feedback visual através de loading states.
///
/// ## Estado Gerenciado:
/// - [isLoading] - Indica se uma operação está em andamento
///
/// ## Métodos Públicos:
/// - [handleSubmit] - Processa submissão do formulário com loading
///
/// ## Ciclo de Vida do Loading:
/// 1. Usuário clica no botão
/// 2. `isLoading` = true → UI mostra CircularProgressIndicator
/// 3. Executa operação assíncrona (simulada)
/// 4. Chama callback original da página
/// 5. `isLoading` = false → UI volta ao estado normal
abstract class AuthFormViewModel extends State<AuthForm> {
  /// Estado de loading que indica se uma operação está em andamento.
  ///
  /// **Estados:**
  /// - `false` - Estado normal, botão habilitado
  /// - `true` - Operação em andamento, mostra loading indicator
  bool isLoading = false;

  /// Processa a submissão do formulário com gerenciamento de loading state.
  ///
  /// Implementa o padrão async/await para operações de rede, fornecendo
  /// feedback visual através de estados de loading.
  ///
  /// ## Fluxo de Execução:
  /// 1. **Start Loading:** Define `isLoading = true` e atualiza UI
  /// 2. **Simulate Network:** Delay de 2 segundos (simula API call)
  /// 3. **Execute Callback:** Chama `widget.onButtonSubmit()` da página
  /// 4. **Error Handling:** Captura e loga erros
  /// 5. **Cleanup:** Sempre define `isLoading = false` no final
  ///
  /// ## Segurança:
  /// - Verifica `mounted` antes de `setState` (evita memory leaks)
  /// - Usa `try/catch/finally` para garantir cleanup
  /// - Protege contra múltiplas submissões simultâneas
  Future<void> handleSubmit() async {
    setState(() => isLoading = true);

    try {
      // Simula operação de rede (API call, validação, etc)
      // Em produção, aqui seria uma chamada real para API
      await Future.delayed(const Duration(seconds: 2));

      // Executa o callback específico da página (login, signup, etc)
      widget.onButtonSubmit();
    } catch (e) {
      // Tratamento de erros - em produção mostraria mensagem para usuário
      debugPrint('Erro ao submeter formulário: $e');
    } finally {
      // Cleanup: sempre remove loading state, mesmo em caso de erro
      // Verifica se widget ainda está montado para evitar setState em widget disposed
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}
