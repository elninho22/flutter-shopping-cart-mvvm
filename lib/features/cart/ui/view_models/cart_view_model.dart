import '../../../../../core/command.dart';
import '../../../../../core/result.dart';
import '../../../../exports.dart';

class CartViewModel {
  final CartStore store;
  final CartRepository _repository;

  CartViewModel(this.store, this._repository) {
    addToCartCommand = Command1<Product, void>(_addToCart);
    removeFromCartCommand = Command1<String, void>(_removeFromCart);
    updateQuantityCommand = Command1<({String productId, int quantity}), void>(
      (arg) => _updateQuantity(arg.productId, arg.quantity),
    );
    finalizeCartCommand = Command0<void>(_finalizeCart);
  }

  late final Command1<Product, void> addToCartCommand;
  late final Command1<String, void> removeFromCartCommand;
  late final Command1<({String productId, int quantity}), void> updateQuantityCommand;
  late final Command0<void> finalizeCartCommand;

  Future<Result<void>> _addToCart(Product product) async {
    
    if (!store.canAddProduct(product.id ?? '')) {
      return const Failure('Limite de 10 produtos diferentes atingido.');
    }

    final result = await _repository.addToCart(
      product: product,
      quantity: 1,
      currentItems: store.items,
    );


    switch (result) {
      case Success(value: final items):
        store.setItems(items);
        return const Success(null);
      case Failure(:final error, :final stackTrace):
        return Failure(error, stackTrace);
    }
  }

  Future<Result<void>> _removeFromCart(String productId) async {
    if (!store.canEdit) {
      return const Failure('Carrinho finalizado não pode ser editado.');
    }

    final result = await _repository.removeFromCart(
      productId: productId,
      currentItems: store.items,
    );

    switch (result) {
      case Success(value: final items):
        store.setItems(items);
        return const Success(null);
      case Failure(:final error, :final stackTrace):
        return Failure(error, stackTrace);
    }
  }

  Future<Result<void>> _updateQuantity(String productId, int quantity) async {
    if (!store.canEdit) {
      return const Failure('Carrinho finalizado não pode ser editado.');
    }

    if (quantity <= 0) {
      return _removeFromCart(productId);
    }

    if (!store.canAddProduct(productId)) {
      return const Failure('Limite de 10 produtos diferentes atingido.');
    }

    final result = await _repository.updateQuantity(
      productId: productId,
      quantity: quantity,
      currentItems: store.items,
    );

    switch (result) {
      case Success(value: final items):
        store.setItems(items);
        return const Success(null);
      case Failure(:final error, :final stackTrace):
        return Failure(error, stackTrace);
    }
  }

  Future<void> _setLoadingFake(Duration duration) => Future.delayed(duration);

  Future<Result<void>> _finalizeCart() async {
    await _setLoadingFake(const Duration(seconds: 1));

    if (!store.canEdit) {
      return const Failure('Carrinho já finalizado.');
    }

    if (store.items.isEmpty) {
      return const Failure('Carrinho vazio não pode ser finalizado.');
    }

    final result = await _repository.finalizeCart(currentItems: store.items);

    switch (result) {
      case Success():
        store.setFinalized(true);
        return const Success(null);
      case Failure(:final error, :final stackTrace):
        store.reset();
        return Failure(error, stackTrace);
    }
  }
}
