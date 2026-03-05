import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CartItemsList extends StatelessWidget {
  final List<CartItem> items;
  final CartViewModel cartViewModel;
  final bool isEditable;

  const CartItemsList({
    super.key,
    required this.items,
    required this.cartViewModel,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context) => Visibility(
      replacement:  Center(
        child: Text(
          'Carrinho vazio',
          textAlign: TextAlign.center,
          style: UiTextStyles.heading24(),
        ),
      ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return CartItemCard(
              cartItem: item,
              onRemove: () => cartViewModel.removeFromCartCommand.run(item.product.id ?? ''),
              onQuantityChanged: (newQuantity) =>
                  cartViewModel.updateQuantityCommand.run((productId: item.product.id ?? '', quantity: newQuantity)),
              isEditable: isEditable,
            );
          },
        ),
      );
}
