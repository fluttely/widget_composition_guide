# Widget Composition Guide

Demonstração de arquitetura Flutter nativa, focada em componentização, design system e padrões modernos, sem dependências externas.

---

## 📦 Estrutura Principal

- **[MVVM:](https://learn.microsoft.com/en-us/dotnet/architecture/maui/mvvm)** Separação clara entre lógica (ViewModel) e interface (View)
- **[Design System:](https://fountn.design/resource/the-design-system-guide/)** Tokens centralizados para espaçamento, tamanhos e radius
- **[Composite Pattern:](https://refactoring.guru/design-patterns/composite)** Aplicado na criação de formulários dinâmicos por meio da injeção de campos adicionais em AuthForm. Obs: o próprio Flutter adota esse padrão estrutural de forma nativa.

---

## 🏗️ Arquitetura

```
lib/
├── auth/
│   ├── auth_screen.dart               // Screen: coordena LoginPage/SignUpPage
│   ├── auth_screen_viewmodel.dart     // ViewModel: navegação
│   ├── components/
│   │   ├── auth_form.dart             // Formulário base + composição
│   │   └── auth_form_viewmodel.dart   // ViewModel: loading state
│   ├── login/
│   │   └── login_page.dart            // Page: Login
│   └── signup/
│       ├── signup_page.dart           // Page: Cadastro
│       └── signup_page_viewmodel.dart // ViewModel: termos
├── design_system/
│   ├── components/                    // Botões, inputs, etc.
│   └── theme/
│       ├── app_theme.dart             // InheritedWidget provider
│       └── app_tokens.dart            // Tokens: spacing, radius, sizes
└── main.dart                          // Entry point
```

---

## 🎨 Design System

- **Tokens centralizados:**
  - Spacing: 4, 8, 16, 24, 32
  - Radius: 4, 8, 16
  - Sizes: altura de botões, ícones, inputs, etc.
- **Consistência e acessibilidade:**
  - Touch targets ≥ 48px
  - Hierarquia visual clara

**Exemplo:**

```dart
final buttonHeight = AppDesignSystem.of(context).sizes.buttonHeight;
SizedBox(
  height: buttonHeight,
  child: ElevatedButton()
);
```

---

## 🧩 Componentização & Composition

- **AuthForm:**
  - Campos base: Email, Senha
  - `extraFields`: injeta campos extras (ex: confirmação de senha, nome, termos, CPF, ...)
- **LoginPage:** usa AuthForm sem extras
- **SignUpPage:** usa AuthForm com 3 extras (confirmação, nome, termos)
Sua estrutura já está ótima e muito clara — parabéns! Abaixo está uma versão refinada com melhorias no estilo, fluidez e uso de termos mais consistentes, mantendo o foco na **separação entre estado da UI e regras de negócio**:

---

### 🧩 `AuthFormViewModel` — ViewModel para Formulários de Autenticação

#### 🎯 **Separação Estratégica: `isLoading` vs. Casos de Uso**

O método `handleSubmit()` demonstra uma separação essencial de responsabilidades entre **estado da interface** e **lógica de domínio**:

```dart
Future<void> handleSubmit() async {
  setState(() => isLoading = true);     // 🎨 ESTADO DA UI

  try {
    await Future.delayed(Duration(seconds: 2));
    widget.onButtonSubmit.call();       // 🧠 REGRA DE NEGÓCIO INJETADA
  } finally {
    if (mounted) setState(() => isLoading = false);
  }
}
```

---

#### 🔍 **Por que essa Separação é Importante**

**1. `isLoading` — Controle da UI:**

* Exibe loading, desativa inputs e botões, previne interações repetidas.
* Compartilhado entre diferentes fluxos de autenticação (login, cadastro, etc.).
* Centralizado no `AuthFormViewModel`, garantindo consistência visual.

**2. `onButtonSubmit` — Casos de Uso Injetáveis:**

* Cada tela (Login, Signup, LoginEmailToken, PasswordRecovery, etc) injeta sua própria lógica de negócio.
* O `AuthForm` permanece agnóstico ao que está sendo executado.
* Essa inversão de controle favorece flexibilidade e reutilização.

---

#### 🧪 **Implementação Prática dos Callbacks**

**LoginPage — Autenticação e Navegação:**

```dart
AuthForm(
  onButtonSubmit: () {
    // authService.login(email, password);
    // salvar token
    // Navigator.pushReplacement(HomePage);
  },
)
```

**SignUpPage — Criação de Conta e Confirmação:**

```dart
AuthForm(
  onButtonSubmit: () {
    // validar termos
    // authService.signUp(email, password);
    // Navigator.push(EmailConfirmationPage);
  },
)
```

---

#### ✅ **Benefícios Arquiteturais**

1. **Isolamento de Camadas**: UI e regras de negócio são desacopladas.
2. **Reutilização Máxima**: Um único formulário para múltiplos contextos.
3. **Consistência Visual**: O controle de carregamento (`isLoading`) é único e previsível.
4. **Facilidade de Testes**: Testa-se a lógica da UI e os fluxos de negócio separadamente.
5. **Escalabilidade**: Adicionar novos fluxos (ex: “esqueci minha senha”) é simples — só injetar novo callback.

---

## 🛠️ Debug Helpers

- **DebugContainer:** Overlay colorido para facilitar visualização de layout
- **Ativação:** `AppDesignSystem(debugIsOn: true)`

---

## 📚 Referências e Recomendações

- [Official Flutter App Architecture](https://docs.flutter.dev/app-architecture)
- [Design System Guide](https://fountn.design/resource/the-design-system-guide/)
- [Google Design Guide](https://m3.material.io/)
- [Apple Design Guide](https://developer.apple.com/design/get-started/)
- [Flutter InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Composite Pattern](https://refactoring.guru/design-patterns/composite)
- [Design Patterns](https://refactoring.guru/design-patterns)
- [MVVM](https://learn.microsoft.com/en-us/dotnet/architecture/maui/mvvm)

---

## ✅ Objetivo

Mostrar como criar apps Flutter organizados, escaláveis e fáceis de manter, usando apenas recursos nativos e documentação concisa, ideal para apresentações técnicas e onboarding.
