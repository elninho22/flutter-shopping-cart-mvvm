

import '../../../../exports.dart';

extension CartItemDtoMapper on CartItemDto {
  CartItem toEntity(Product product) => CartItem(
        product: product,
        quantity: quantity,
      );
}