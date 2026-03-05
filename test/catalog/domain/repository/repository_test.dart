import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:test_outforce_app/core/result.dart';
import 'package:test_outforce_app/domain/models/product/product.dart';
import 'package:test_outforce_app/features/catalog/domain/repository/catalog_repository.dart';

class MockCatalogRepository extends Mock implements CatalogRepository {}

void main() {
  late MockCatalogRepository mockRepository;

  setUp(() {
    mockRepository = MockCatalogRepository();
  });

  group('CatalogRepository', () {
    test('getProducts retorna sucesso com lista de produtos', () async {
      const products = [
        Product(id: '1', name: 'Product 1', price: 10, imageUrl: 'www.google.com.br'),
        Product(id: '2', name: 'Product 2', price: 20, imageUrl: 'www.google.com.br'),
      ];

      when(() => mockRepository.getProducts()).thenAnswer((_) async => const Success(products));

      final result = await mockRepository.getProducts();

      expect(result, isA<Success<List<Product>>>());
      expect((result as Success<List<Product>>).value, products);
      verify(() => mockRepository.getProducts()).called(1);
    });

    test('getProducts retorna erro', () async {
      const error = 'Erro ao buscar produtos';

      when(() => mockRepository.getProducts()).thenAnswer((_) async => const Failure(error));

      final result = await mockRepository.getProducts();

      expect(result, isA<Failure>());
      expect((result as Failure).error, error);
      verify(() => mockRepository.getProducts()).called(1);
    });
  });
}
