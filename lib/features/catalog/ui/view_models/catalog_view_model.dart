import 'package:flutter/foundation.dart';

import '../../../../../core/command.dart';
import '../../../../../core/result.dart';
import '../../../../exports.dart';

class CatalogViewModel extends ChangeNotifier {
  final CatalogRepository _repository;

  CatalogViewModel(this._repository) {
    getProductsCommand = Command0<void>(_getProducts);
  }

  final List<Product> _items = [];
  List<Product> get items => List.unmodifiable(_items);

  late final Command0<void> getProductsCommand;

  Future<Result<void>> _getProducts() async {
    await _setLoadingFake(const Duration(seconds: 1));
    final result = await _repository.getProducts();

    switch (result) {
      case Success(value: final products):
        _setItems(products);
        return const Success(null);

      case Failure(error: final error, stackTrace: final st):
        return Failure(error, st);
    }
  }

  Future<void> _setLoadingFake(Duration duration) => Future.delayed(duration);

  void _setItems(List<Product> items) {
    _items
      ..clear()
      ..addAll(items);
    notifyListeners();
  }
}
