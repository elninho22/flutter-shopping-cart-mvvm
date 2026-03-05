import '../../../../exports.dart';


extension CatalogDtoMapper on CatalogDto {
  CatalogModel toEntity() {
    final productEntity = Product(
      id: product.id.toString(),
      name: product.title,
      price: product.price,
      imageUrl: product.image,
      description: product.description,
    );

    return CatalogModel(
      product: productEntity,
      quantity: quantity,
    );
  }
}
