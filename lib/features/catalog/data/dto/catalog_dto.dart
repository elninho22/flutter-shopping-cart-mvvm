import '../../../../data/dtos/product_dto.dart';

class CatalogDto {
  final ProductDto product;
  final int quantity;

  CatalogDto({
    required this.product,
    required this.quantity,
  });

  factory CatalogDto.fromJson(Map<String, dynamic> json) {
    final productMap = json.containsKey('product')
        ? json['product'] as Map<String, dynamic>
        : json;

    return CatalogDto(
      product: ProductDto.fromJson(productMap),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'image': product.image,
        },
        'quantity': quantity,
      };
}
