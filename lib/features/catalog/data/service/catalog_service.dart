import '../../../../exports.dart';

class CatalogService {
  final RestClient _network;

  CatalogService(this._network);

  Future<List<CatalogDto>> getProducts() async {
    final response = await _network.unauth().get(ConstPath.products);
    return (response.data as List).map((e) => CatalogDto.fromJson(e)).toList();
  }
}
