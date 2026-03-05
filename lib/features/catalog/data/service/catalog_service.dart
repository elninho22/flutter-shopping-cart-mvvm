import '../../../../core/result.dart';
import '../../../../exports.dart';

class CatalogService {
  final RestClient _network;

  CatalogService(this._network);

  Future<Result<List<ProductDto>>> getProducts() async {
    try {
      final response = await _network.unauth().get(ConstPath.products);
      final products = (response.data as List).map((e) => ProductDto.fromJson(e)).toList();
      return Success(products);
    } catch (e) {
      return Failure('Erro ao buscar produtos: $e');
    }
  }
}