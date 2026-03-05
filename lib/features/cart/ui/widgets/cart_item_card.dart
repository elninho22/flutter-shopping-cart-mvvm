import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;
  final bool isEditable;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onQuantityChanged,
    required this.isEditable,
  });

  double get subtotal => (cartItem.product.price ?? 0) * cartItem.quantity;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: UiThemeColors.neutral30,
            ),
            child: Visibility(
              visible: cartItem.product.imageUrl?.isNotEmpty ?? false,
              replacement: const Icon(Icons.image_not_supported),
              child: Image.network(
                cartItem.product.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name ?? 'Produto',
                  style: UiTextStyles.body14(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'R\$ ${(cartItem.product.price ?? 0).toStringAsFixed(2)}',
                  style: UiTextStyles.body12(),
                ),
                Text(
                  'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}',
                  style: UiTextStyles.body12(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isEditable,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onRemove,
                  child: Row(
                    children: [
                      Text('Excluir', style: UiTextStyles.body12(color: UiThemeColors.error)),
                      const Icon(
                        Icons.close,
                        size: 20,
                        color: UiThemeColors.error,
                      ),
                    ],
                  ),
                ),
                ProductQuantityControl(
                  quantity: cartItem.quantity,
                  onDecrement: () => onQuantityChanged(cartItem.quantity - 1),
                  onIncrement: () => onQuantityChanged(cartItem.quantity + 1),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
