import '../../../../exports.dart';

class CatalogModel {
  final Product product;
  final int quantity;

  const CatalogModel({
    required this.product,
    required this.quantity,
  });

  CatalogModel copyWith({
    Product? product,
    int? quantity,
  }) => CatalogModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
}
