import '../../../../core/result.dart';
import '../../../../exports.dart';

class CartService {
  Future<Result<List<CartItemDto>>> addToCart({
    required ProductDto product,
    required int quantity,
    required List<CartItemDto> currentItems,
  }) async {
    final dataItems = List<CartItemDto>.from(currentItems);
    final indexItems = dataItems.indexWhere((i) => i.product.id == product.id);
    if (indexItems >= 0) {
      dataItems[indexItems] = CartItemDto(
        product: dataItems[indexItems].product,
        quantity: dataItems[indexItems].quantity + quantity,
      );
    } else {
      dataItems.add(CartItemDto(product: product, quantity: quantity));
    }
    return Success(dataItems);
  }

  Future<Result<List<CartItemDto>>> removeFromCart({
    required String productId,
    required List<CartItemDto> currentItems,
  }) async {
    final dataItems = currentItems.where((i) => i.product.id.toString() != productId).toList();
    return Success(dataItems);
  }

  Future<Result<List<CartItemDto>>> updateQuantity({
    required String productId,
    required int quantity,
    required List<CartItemDto> currentItems,
  }) async {
    final dataItems = List<CartItemDto>.from(currentItems);
    final indexItems = dataItems.indexWhere((i) => i.product.id.toString() == productId);
    if (indexItems >= 0) {
      dataItems[indexItems] = CartItemDto(
        product: dataItems[indexItems].product,
        quantity: quantity,
      );
    }
    return Success(dataItems);
  }

  Future<Result<void>> finalizeCart({
    required List<CartItemDto> currentItems,
  }) async => const Success(null);
}
