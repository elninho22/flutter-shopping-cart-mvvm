import 'package:flutter/foundation.dart';

import '../../../../core/command.dart';
import '../../../../core/result.dart';
import '../../../exports.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _repository;

  CartViewModel(this._repository) {
    addProductCommand = Command<CartItem, void>(_addProduct);
    removeProductCommand = Command<String, void>(_removeProduct);
  }

  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  late final Command<CartItem, void> addProductCommand;
  late final Command<String, void> removeProductCommand;

  Future<Result<void>> _addProduct(CartItem item) async {
    final result = await _repository.addProduct(productId: item.product.id);

    switch (result) {
      case Success():
        final index = _items.indexWhere((e) => e.product.id == item.product.id);

        if (index == -1) {
          _setItems([..._items, item]);
        } else {
          final current = _items[index];
          final updated = current.copyWith(
            quantity: current.quantity + item.quantity,
          );

          final updatedList = [..._items];
          updatedList[index] = updated;
          _setItems(updatedList);
        }

        return const Success(null);

      case Failure():
        return result;
    }
  }

  Future<Result<void>> _removeProduct(String productId) async {
    final result = await _repository.removeProduct(productId: productId);

    switch (result) {
      case Success():
        final updatedList =
            _items.where((e) => e.product.id != productId).toList();

        _setItems(updatedList);

        return const Success(null);

      case Failure():
        return result;
    }
  }

  void _setItems(List<CartItem> items) {
    _items
      ..clear()
      ..addAll(items);
    notifyListeners();
  }
}