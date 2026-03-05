import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_outforce_app/core/result.dart';
import 'package:test_outforce_app/data/dtos/product/product_dto.dart';
import 'package:test_outforce_app/domain/models/product/product.dart';
import 'package:test_outforce_app/features/catalog/catalog_export.dart';

class MockCatalogService extends Mock implements CatalogService {}

void main() {
  late MockCatalogService service;
  late CatalogRepositoryImpl repository;

  setUp(() {
    service = MockCatalogService();
    repository = CatalogRepositoryImpl(service);
  });

  test('RepositoryImpl: retorna Success<List<Product>> quando service retorna Success<List<ProductDto>>', () async {
    final dto = [
      ProductDto(id: 1, title: 'Product 1', price: 10, image: 'www.google.com.br'),
      ProductDto(id: 2, title: 'Product 2', price: 20, image: 'www.google.com.br'),
    ];

    when(() => service.getProducts())
        .thenAnswer((_) async => Success<List<ProductDto>>(dto));

    final result = await repository.getProducts();

    expect(result, isA<Success<List<Product>>>());
    final products = (result as Success<List<Product>>).value;

    expect(products.length, 2);
    expect(products.first.id, '1');

    verify(() => service.getProducts()).called(1);
  });

  test('RepositoryImpl: propaga Failure quando service retorna Failure', () async {
    when(() => service.getProducts())
        .thenAnswer((_) async => const Failure('Erro ao buscar'));

    final result = await repository.getProducts();

    expect(result, isA<Failure>());
    expect((result as Failure).error, 'Erro ao buscar');

    verify(() => service.getProducts()).called(1);
  });
}