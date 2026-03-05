import '../../../../exports.dart';

class CatalogService {
  final RestClient _network;

  CatalogService(this._network);

  Future<List<ProductDto>> getProducts() async {
    final response = await _network.unauth().get(ConstPath.products);
    return (response.data as List).map((e) => ProductDto.fromJson(e)).toList();
  }
}
