import '../../../../data/dtos/product_dto.dart';

class CartItemDto {
  final ProductDto product;
  final int quantity;

  CartItemDto({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'product': {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'image': product.image,
        },
        'quantity': quantity,
      };
}
