import '../../../../exports.dart';

extension ProductDtoMapper on ProductDto {
  Product toProduct() => Product(
        id: id.toString(),
        name: title,
        price: price,
        imageUrl: image,
        description: description,
      );
}
