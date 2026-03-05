import '../../../../core/result.dart';
import '../../../../exports.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogService _service;

  CatalogRepositoryImpl(this._service);

  @override
  Future<Result<List<Product>>> getProducts() async {
    final result = await _service.getProducts();
    if (result is Success<List<ProductDto>>) {
      final products = result.value.map((e) => e.toProduct()).toList();
      return Success(products);
    } else if (result is Failure) {
      return Failure(result.errorOrNull.toString());
    } else {
      return const Failure('Erro desconhecido');
    }
  }
}