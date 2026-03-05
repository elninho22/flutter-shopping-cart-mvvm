import 'package:flutter/foundation.dart';

import '../domain/models/cart_item.dart';

class CartStore extends ChangeNotifier {
  final List<CartItem> _items = [];
  bool _isFinalized = false;

  List<CartItem> get items => List.unmodifiable(_items);
  bool get isFinalized => _isFinalized;
  int get itemCount => _items.fold(0, (sum, i) => sum + i.quantity);
  bool get canEdit => !_isFinalized;

  int get _differentProductsCount =>
      _items.map((i) => i.product.id).toSet().length;

  void setItems(List<CartItem> newItems) {
    if (_isFinalized) return;
    if (_exceedsMaxDifferentProducts(newItems)) return;

    _items
      ..clear()
      ..addAll(newItems);
    notifyListeners();
  }

  void setFinalized(bool value) {
    _isFinalized = value;
    notifyListeners();
  }

  bool _exceedsMaxDifferentProducts(List<CartItem> list) =>
      list.map((i) => i.product.id).toSet().length > 10;


  bool canAddProduct(String productId) {
    if (_isFinalized) return false;
    if (_items.any((i) => i.product.id == productId)) return true;
    return _differentProductsCount < 10;
  }
}
