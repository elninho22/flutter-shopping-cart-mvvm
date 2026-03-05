import '../../../../core/result.dart';
import '../../../../exports.dart';


class CartRepositoryImpl implements CartRepository {
  final CartService _service;

  CartRepositoryImpl(this._service);

  @override
  Future<Result<List<CartItem>>> addToCart({
    required Product product,
    required int quantity,
    required List<CartItem> currentItems,
  }) async {
    final currentDtos = currentItems.map((i) => _toDto(i)).toList();
    final result = await _service.addToCart(
      product: product.toDto(),
      quantity: quantity,
      currentItems: currentDtos,
    );

    return switch (result) {
      Success(value: final dtos) => Success(dtos.map((d) => d.toEntity()).toList()),
      Failure(:final error, :final stackTrace) => Failure(error, stackTrace),
    };
  }

  @override
  Future<Result<List<CartItem>>> removeFromCart({
    required String productId,
    required List<CartItem> currentItems,
  }) async {
    final currentDtos = currentItems.map((i) => _toDto(i)).toList();
    final result = await _service.removeFromCart(
      productId: productId,
      currentItems: currentDtos,
    );

    return switch (result) {
      Success(value: final dtos) => Success(dtos.map((d) => d.toEntity()).toList()),
      Failure(:final error, :final stackTrace) => Failure(error, stackTrace),
    };
  }

  @override
  Future<Result<List<CartItem>>> updateQuantity({
    required String productId,
    required int quantity,
    required List<CartItem> currentItems,
  }) async {
    final currentDtos = currentItems.map((i) => _toDto(i)).toList();
    final result = await _service.updateQuantity(
      productId: productId,
      quantity: quantity,
      currentItems: currentDtos,
    );

    return switch (result) {
      Success(value: final dtos) => Success(dtos.map((d) => d.toEntity()).toList()),
      Failure(:final error, :final stackTrace) => Failure(error, stackTrace),
    };
  }

  @override
  Future<Result<void>> finalizeCart({
    required List<CartItem> currentItems,
  }) async {
    final currentDtos = currentItems.map((i) => _toDto(i)).toList();
    return _service.finalizeCart(currentItems: currentDtos);
  }

  CartItemDto _toDto(CartItem item) =>
      CartItemDto(product: item.product.toDto(), quantity: item.quantity);
}
