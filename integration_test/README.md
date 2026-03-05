# Testes de Integração

Este diretório contém testes de integração para o aplicativo OutForce.

## Como executar

1. Certifique-se de ter um dispositivo ou emulador conectado:
   - Android: `flutter devices` deve mostrar um dispositivo

2. Execute os testes:
   flutter test integration_test/


## Testes incluídos

- `app_integration_test.dart`: Testa o fluxo completo do usuário: navegar do catálogo ao carrinho e confirmação de pedido.

## Notas

- Os testes assumem que há produtos disponíveis no catálogo.
