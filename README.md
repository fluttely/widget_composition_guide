# Widget Composition Guide

Demonstração de arquitetura Flutter nativa, focada em componentização, design system e padrões modernos, sem dependências externas.

---

## 📦 Estrutura Principal

- **[MVVM:](https://learn.microsoft.com/en-us/dotnet/architecture/maui/mvvm)** Separação clara entre lógica (ViewModel) e interface (View)
- **[Design System:](https://fountn.design/resource/the-design-system-guide/)** Tokens centralizados para espaçamento, tamanhos e radius
- **[Composite Pattern:](https://refactoring.guru/design-patterns/composite)** Formulários dinâmicos via injeção de campos extras. Porém Flutter em si já segue esse pattern por natureza.

---

## 🏗️ Arquitetura

```
lib/
├── auth/
│   ├── auth_screen.dart           // Screen: coordena LoginPage/SignUpPage
│   ├── auth_screen_viewmodel.dart // ViewModel: navegação
│   ├── components/
│   │   ├── auth_form.dart         // Formulário base + composição
│   │   └── auth_form_viewmodel.dart // ViewModel: loading state
│   ├── login/
│   │   └── login_page.dart        // Page: Login
│   └── signup/
│       ├── signup_page.dart       // Page: Cadastro
│       └── signup_page_viewmodel.dart // ViewModel: termos
├── design_system/
│   ├── components/                // Botões, inputs, etc.
│   └── theme/
│       ├── app_theme.dart         // InheritedWidget provider
│       └── app_tokens.dart        // Tokens: spacing, radius, sizes
└── main.dart                      // Entry point
```

---

## 🎨 Design System

- **Tokens centralizados:**
  - Spacing: 4, 8, 16, 24, 32
  - Radius: 4, 8, 16
  - Sizes: altura de botões, ícones, inputs, etc.
- **Consistência e acessibilidade:**
  - Touch targets ≥ 44px
  - Hierarquia visual clara

**Exemplo:**

```dart
final theme = AppDesignSystem.of(context);
SizedBox(height: theme.sizes.buttonHeight);
```

---

## 🧩 Componentização & Composition

- **AuthForm:**
  - Campos base: Email, Senha
  - `extraFields`: injeta campos extras (ex: nome, termos)
- **LoginPage:** usa AuthForm sem extras
- **SignUpPage:** usa AuthForm com 3 extras (confirmação, nome, termos)

---

## 🔄 MVVM & Estados

- **ViewModel:**
  - Gerencia loading, navegação, aceitação de termos
- **StatefulWidget:**
  - Apenas onde há estado local relevante
- **Async/await:**
  - Simulação de loading com try/catch/finally

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
