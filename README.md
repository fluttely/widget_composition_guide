# Widget Composition Guide - Flutter

## 📝 Contexto e Propósito

Este projeto demonstra **estruturas arquiteturais e boas práticas** para desenvolvimento Flutter, criado como exemplo prático para apresentações técnicas. O foco está na **componentização robusta vs simplicidade**, usando **apenas Flutter nativo** sem packages externos.

**⚠️ Nota:** Desenvolvido em uma tarde como demonstração - sugestões e melhorias são bem-vindas via issues/PRs.

---

## 🏗️ Arquitetura Implementada

### **1. Padrão MVVM (Model-View-ViewModel)**

#### **📁 Estrutura:**
```
📦 auth/
├── 📄 auth_screen.dart           # Screen (Coordenador)
├── 📄 auth_screen_viewmodel.dart # ViewModel (Lógica)
├── 📁 login/
│   └── 📄 login_page.dart        # Page (Funcionalidade)
├── 📁 signup/
│   ├── 📄 signup_page.dart       # Page (Funcionalidade)
│   └── 📄 signup_page_viewmodel.dart # ViewModel (Estado)
└── 📁 components/
    ├── 📄 auth_form.dart         # Component (Reutilizável)
    └── 📄 auth_form_viewmodel.dart # ViewModel (Lógica)
```

#### **🔍 Evidências Técnicas:**
- **Arquivo:** `lib/auth/auth_screen.dart:12-15`
  ```dart
  class AuthScreen extends StatefulWidget {
    @override
    State<AuthScreen> createState() => _AuthScreenView(); // ← View
  }
  ```

- **Arquivo:** `lib/auth/auth_screen_viewmodel.dart:4-9`
  ```dart
  abstract class AuthScreenViewModel extends State<AuthScreen> {
    String currentPage = 'login';           // ← Estado
    void switchAuthPage() { ... }           // ← Lógica de negócio
  }
  ```

---

### **2. Nomenclatura: Screen vs Page vs View**

#### **🏛️ SCREEN** (`AuthScreen`)
**Responsabilidade:** Coordenador de alto nível, conhece múltiplas pages
- **Localização:** `lib/auth/auth_screen.dart:10`
- **Função:** Orquestra navegação entre Login/SignUp
- **Evidência:** Linha 27-30 - renderiza condicionalmente `LoginPage()` ou `SignUpPage()`

#### **📄 PAGE** (`SignUpPage`, `LoginPage`)
**Responsabilidade:** Funcionalidade específica e completa
- **Localização:** `lib/auth/signup/signup_page.dart:7`
- **Função:** Contém toda lógica de uma funcionalidade específica
- **Evidência:** Gerencia estado `acceptTerms` e validação (linha 25-33)

#### **🎨 VIEW** (`_AuthScreenView`, `_SignUpPageView`)
**Responsabilidade:** Apenas apresentação visual
- **Localização:** `lib/auth/auth_screen.dart:18`
- **Função:** Constrói interface usando ViewModel
- **Evidência:** Método `build()` apenas renderiza, não contém lógica

---

## 🎨 Design System

### **3. Token System Implementado**

#### **📊 Tokens Disponíveis:**
```dart
// lib/design_system/theme/app_tokens.dart
class AppSpacing {
  final double extraSmall = 4.0;   // 4px
  final double small = 8.0;        // 8px  
  final double medium = 16.0;      // 16px
  final double large = 24.0;       // 24px
  final double extraLarge = 32.0;  // 32px
}

class AppRadius {
  final double small = 4.0;        // 4px
  final double medium = 8.0;       // 8px
  final double large = 16.0;       // 16px
}

class AppSizes {
  final double buttonHeight = 48.0;           // Altura padrão botões
  final double buttonHeightSecondary = 40.0;  // Altura botões secundários
  final double iconSize = 24.0;               // Tamanho padrão ícones
  final double iconSizeSmall = 16.0;          // Ícones pequenos
  final double iconSizeLarge = 32.0;          // Ícones grandes
  final double avatarSize = 40.0;             // Avatares pequenos
  final double avatarSizeMedium = 56.0;       // Avatares médios
  final double minTouchTarget = 44.0;         // Área mínima de toque
  final double inputHeight = 56.0;            // Altura inputs
  final double maxContentWidth = 600.0;       // Largura máxima conteúdo
}
```

#### **🔌 Injeção de Tema (InheritedWidget)**
- **Arquivo:** `lib/design_system/theme/app_theme.dart:4`
- **Padrão:** InheritedWidget nativo do Flutter
- **Vantagem:** Acesso em qualquer lugar da árvore de widgets

#### **📐 Sistema de Tamanhos (AppSizes)**
- **Arquivo:** `lib/design_system/theme/app_tokens.dart:85-150`
- **Propósito:** Dimensões padronizadas para componentes
- **Baseado em:** Material Design Guidelines + Acessibilidade

**Benefícios do AppSizes:**
1. **Consistência Visual:** Todos os botões têm a mesma altura
2. **Acessibilidade:** Touch targets seguem diretrizes (min 44px)
3. **Hierarquia:** Diferentes tamanhos criam hierarquia visual
4. **Manutenibilidade:** Mudanças centralizadas refletem em todo app

**Casos de Uso:**
```dart
// Botões com altura consistente
SizedBox(
  height: theme.sizes.buttonHeight,     // 48px
  child: ElevatedButton(...),
)

// Ícones padronizados
Icon(Icons.star, size: theme.sizes.iconSize)  // 24px

// Touch targets acessíveis
GestureDetector(
  child: Container(
    height: theme.sizes.minTouchTarget,  // 44px
    child: Text('Tap me'),
  ),
)
```

#### **📖 Consumo do Tema:**
```dart
// Exemplo em: lib/auth/auth_screen.dart:21-22
final theme = AppTheme.of(context);
final extraLargeSpacing = theme.spacing.extraLarge;
final buttonHeight = theme.sizes.buttonHeight;
final iconSize = theme.sizes.iconSize;
```

---

## 🧩 Componentização

### **4. Composition Pattern Implementado**

#### **🔄 AuthForm - Composição Dinâmica**
- **Arquivo:** `lib/auth/components/auth_form.dart:7-16`
- **Padrão:** Aceita `extraFields` como parâmetro
- **Benefício:** Reutilização entre Login (sem campos extras) e SignUp (com campos extras)

```dart
// Evidência - SignUp usa extraFields:
extraFields: [
  AppTextField(label: 'Confirmar Senha', isPassword: true),
  AppTextField(label: 'Nome Completo'),
  _TermsCheckbox(...),
]
```

#### **🎛️ Controle de Estado Centralizado**
- **Loading State:** `lib/auth/components/auth_form_viewmodel.dart`
- **Validation:** Gerenciado no componente pai
- **State Management:** StatefulWidget + ViewModel

---

### **5. Component Hierarchy**

```
🏛️ AuthScreen (Coordenador)
├── 📄 LoginPage (Funcionalidade específica)
│   └── 🧩 AuthForm (Componente reutilizável)
└── 📄 SignUpPage (Funcionalidade específica)
    ├── 🧩 AuthForm (Mesmo componente)
    └── ☑️ _TermsCheckbox (Componente específico)
```

---

## 🔧 Funcionalidades Técnicas

### **6. Estado de Loading Assíncrono**
- **Arquivo:** `lib/auth/components/auth_form_viewmodel.dart:6-24`
- **Implementação:** Future + setState pattern
- **UX:** CircularProgressIndicator durante operações

### **7. Validação de Formulário**
- **Checkbox validation:** `lib/auth/signup/signup_page.dart:25-33`
- **Feedback visual:** SnackBar para erros
- **Pattern:** Validation no callback da Page

### **8. Debug Helpers**
- **Arquivo:** `lib/debug_helpers.dart`
- **Funcionalidade:** DebugContainer para visualizar áreas de layout
- **Ativação:** `AppTheme(debugIsOn: true)`

---

## 📚 Referências Técnicas para Estudo

### **🏗️ Padrões Arquiteturais:**
1. **MVVM Pattern:** Clean Architecture (Uncle Bob)
2. **InheritedWidget:** [Flutter Official Docs](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
3. **Composition over Inheritance:** Design Patterns (Gang of Four)

### **🎨 Design System:**
1. **Design Tokens:** [Design Systems Handbook](https://www.designbetter.co/design-systems-handbook)
2. **Atomic Design:** Brad Frost - Atomic Design Methodology

### **🧩 Widget Composition:**
1. **Flutter Widget Patterns:** [Flutter Official Cookbook](https://docs.flutter.dev/cookbook)
2. **State Management:** [Flutter State Management Guide](https://docs.flutter.dev/development/data-and-backend/state-mgmt)

---

## 🚀 Próximos Passos (TODO)

### **Melhorias Arquiteturais:**
- [ ] Implementar Repository Pattern para camada Data
- [ ] Adicionar UseCases (Clean Architecture)
- [ ] Implementar Dependency Injection
- [ ] Adicionar testes unitários para ViewModels

### **Design System:**
- [ ] Expandir tokens (Colors, Typography, Shadows)
- [ ] Implementar componentes atômicos (Button, Input, etc)
- [ ] Criar theme switcher (Light/Dark)
- [ ] Documentar componentes com Storybook/Widgetbook

### **Funcionalidades:**
- [ ] Validação de formulário robusta
- [ ] Navegação com GoRouter
- [ ] Internacionalização (i18n)
- [ ] Accessibility (a11y) compliance

---

## 💡 Conceitos Demonstrados

✅ **MVVM** - Separação clara View/ViewModel
✅ **Composition Pattern** - AuthForm reutilizável
✅ **InheritedWidget** - Theme injection nativo
✅ **Design Tokens** - Spacing/Radius/Sizes system
✅ **Consistent Sizing** - AppSizes para dimensões padronizadas
✅ **Accessibility** - Touch targets e dimensões adequadas
✅ **State Management** - StatefulWidget + callbacks
✅ **Widget Hierarchy** - Screen/Page/View/Component
✅ **Debug Tools** - Visual layout helpers
✅ **Flutter Patterns** - Nativo, sem packages externos

---

**🎯 Objetivo:** Demonstrar que é possível criar arquiteturas robustas e escaláveis usando apenas Flutter nativo, com foco na organização, reutilização e manutenibilidade do código.