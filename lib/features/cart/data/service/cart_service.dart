import '../../../../exports.dart';

class CartService {
  final RestClient _network;

  CartService(this._network);

  Future<CartItemDto> addProduct(String productId) async {
    final response = await _network.post(ConstPath.alias, data: {'productId': productId});
    return CartItemDto.fromJson(response.data!);
  }

  Future<void> removeProduct(String productId) async {
    await _network.delete('/cart/remove/$productId');
  }
}
