import '../../../../data/data.dart';
import '../../../../exports.dart';

extension CartItemDtoMapper on CartItemDto {
  CartItem toEntity() => CartItem(
        product: product.toEntity(),
        quantity: quantity,
      );
}

extension ProductDtoToEntity on ProductDto {
  Product toEntity() => Product(
        id: id.toString(),
        name: title,
        price: price,
        imageUrl: image,
        description: description,
      );
}

extension ProductToDto on Product {
  ProductDto toDto() => ProductDto(
        id: int.tryParse(id.toString()) ?? 0,
        title: name,
        price: price,
        description: description,
        image: imageUrl,
      );
}
