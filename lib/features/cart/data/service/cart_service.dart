import '../../../../core/result.dart';
import '../../../../data/dtos/product_dto.dart';
import '../../../../exports.dart';

class CartService {
  Future<Result<List<CartItemDto>>> addToCart({
    required ProductDto product,
    required int quantity,
    required List<CartItemDto> currentItems,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final differentIds = currentItems.map((i) => i.product.id).toSet();
    if (!differentIds.contains(product.id) && differentIds.length >= 10) {
      return const Failure(
        'Não é possível adicionar mais de 10 produtos diferentes.',
      );
    }

    final updated = List<CartItemDto>.from(currentItems);
    final idx = updated.indexWhere((i) => i.product.id == product.id);
    if (idx >= 0) {
      updated[idx] = CartItemDto(
        product: updated[idx].product,
        quantity: updated[idx].quantity + quantity,
      );
    } else {
      updated.add(CartItemDto(product: product, quantity: quantity));
    }
    return Success(updated);
  }

  Future<Result<List<CartItemDto>>> removeFromCart({
    required String productId,
    required List<CartItemDto> currentItems,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final updated = currentItems
        .where((i) => i.product.id.toString() != productId)
        .toList();
    return Success(updated);
  }

  Future<Result<List<CartItemDto>>> updateQuantity({
    required String productId,
    required int quantity,
    required List<CartItemDto> currentItems,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (quantity <= 0) {
      final updated = currentItems
          .where((i) => i.product.id.toString() != productId)
          .toList();
      return Success(updated);
    }

    final updated = List<CartItemDto>.from(currentItems);
    final idx = updated.indexWhere((i) => i.product.id.toString() == productId);
    if (idx >= 0) {
      updated[idx] = CartItemDto(
        product: updated[idx].product,
        quantity: quantity,
      );
    }
    return Success(updated);
  }

  Future<Result<void>> finalizeCart({
    required List<CartItemDto> currentItems,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (currentItems.isEmpty) {
      return const Failure('Carrinho vazio não pode ser finalizado.');
    }
    return const Success(null);
  }
}
