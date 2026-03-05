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

---

## 🛠 Requisitos para execução

- **Flutter**: 3.41.4 
- **Dart SDK**: 3.11.1 (via `environment: sdk: ^3.11.0` no `pubspec.yaml`)

---

## 🚀 Como executar o aplicativo

1. Clone o repositório e entre na pasta do projeto:


git clone <repo-url>
cd appoutforce


2. Instale as dependências:

flutter pub get

3. Inicie em um dispositivo conectado ou emulador:

flutter run

4. Para executar os testes unitários e de widget:

flutter test

5. Para rodar os testes de integração:

flutter test integration_test/

---

## 📦 Dependências principais

- `dio`, `logger` – rede e logging
- `flutter_modular` – injeção de dependência
- `google_fonts`, `intl`,

<img width="300" height="600" alt="Screenshot_1772748718" src="https://github.com/user-attachments/assets/bd0c4e56-d48d-47ee-919f-c4592ad2e9b7" />
<img width="300" height="600" alt="Screenshot_1772748713" src="https://github.com/user-attachments/assets/c4ee962f-15a9-43a4-ab93-cb189036d823" />
<img width="300" height="600" alt="Screenshot_1772748708" src="https://github.com/user-attachments/assets/6073064e-bb31-4644-9579-f53e4ba7848c" />
<img width="300" height="600" alt="Screenshot_1772748699" src="https://github.com/user-attachments/assets/e79b1982-f33f-450f-8fa6-66298a1c8902" />
<img width="300" height="600" alt="Screenshot_1772748693" src="https://github.com/user-attachments/assets/62cbe8e0-7dcc-4797-928b-9632ac83903f" />
<img width="300" height="600" alt="Screenshot_1772748682" src="https://github.com/user-attachments/assets/51b6f209-0629-4331-9611-c89d6d7de76e" />

