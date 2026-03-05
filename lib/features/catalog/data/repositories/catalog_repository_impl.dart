import '../../../../core/result.dart';
import '../../../../exports.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogService _service;

  CatalogRepositoryImpl(this._service);

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      final result = await _service.getProducts();
      return Success(result.map((e) => e.toProduct()).toList());
    } on RestClientException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(Exception('Erro ao listar produtos!'));
    }
  }
}
