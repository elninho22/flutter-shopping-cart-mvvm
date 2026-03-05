# Outforce App

Desafio Flutter - App de Carrinho de Compras (Arquitetura MVVM)

---

## 📁 Estrutura de Camadas

O código está organizado em quatro camadas principais, seguindo princípios de
Domain‑Driven Design e Clean Architecture:

1. **core/**
   - Components reutilizáveis do app: constantes, helpers, temas, configuração
de rota, rede genérica e módulos core.
   - A componentização também inclui classes para estilos e widgets base –
     cores, `TextStyle`s, botões, `TextField`s, bottom sheets personalizados.
    Essas definições estão centralizadas para manter consistência visual
     e facilitar alterações globais.
   - Exemplo: `core/network/`, `core/routes/`, `core/ui_theme/`.

2. **data/**
   - Implementações de acesso a dados (APIs REST).
   - Contém modelos, DTOs e repositórios que convertem dados externos para o
formato usado pela camada de domínio.
   - Exemplo: `data/dtos/`, `data/data.dart`.

3. **domain/**
   - Regras de negócio puras: entidades e interfaces de repositório abstratas.
   - Exemplo: `domain/models/`, `domain/domain.dart`.

4. **features/**
   - Implementação de funcionalidades específicas (carrinho, catálogo).
   - Cada feature replica a estrutura principal:
     - `data/` (implementações e modelos para essa feature)
     - `domain/` (entidades e contratos públicos)
     - `view/` (widgets e telas organizadas por fluxo)
     - `viewmodel/` (responsáveis por conter estados e expor `Command`/
       `Result` usados para apresentação)
   - A camada de `viewmodel` utiliza a convenção `command/result` para
     representar ações e seus resultados à interface.
   - `features/cart/`, `features/catalog/`.

Além disso, o arquivo `app_module.dart` e `app_widget.dart` na raiz do
`lib/` iniciam o Flutter Modular e carregam o tema e as rotas principais.

---

## 🛠 Requisitos para execução

- **Flutter**: 3.41.4 (canal stable) – instalado a partir de
  `https://github.com/flutter/flutter.git`
- **Dart SDK**: 3.11.1 (via `environment: sdk: ^3.11.0` no `pubspec.yaml`)
- Ferramentas padrão: `flutter`, `dart`, `flutter_test`, `integration_test`.

Você pode verificar as versões executando:

```bash
flutter --version
# Flutter 3.41.4 • channel stable • …
# Tools • Dart 3.11.1 • …
```

---

## 🚀 Como executar o aplicativo

1. Clone o repositório e entre na pasta do projeto:

```bash
git clone <repo-url>
cd appoutforce
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Inicie em um dispositivo conectado ou emulador:

```bash
flutter run
```

4. Para executar os testes unitários e de widget:

```bash
flutter test
```

5. Para rodar os testes de integração:

```bash
flutter test integration_test/
```

---

## 📦 Dependências principais

- `dio`, `logger` – rede e logging
- `flutter_modular` – injeção de dependência
- `google_fonts`, `flutter_svg`, `intl`, etc. para UI e internacionalização
