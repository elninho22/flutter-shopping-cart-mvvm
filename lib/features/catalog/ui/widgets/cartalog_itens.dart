import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CartalogItens extends StatelessWidget {
  final Product item;
  final VoidCallback? onAddToCart;
  final CartStore? cartStore;
  final ValueChanged<int>? onQuantityIncrement;
  final ValueChanged<int>? onQuantityDecrement;

  const CartalogItens({
    super.key,
    required this.item,
    this.onAddToCart,
    this.cartStore,
    this.onQuantityIncrement,
    this.onQuantityDecrement,
  });

  @override
  Widget build(BuildContext context) => Card(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    item.imageUrl ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                item.name ?? '',
                style: UiTextStyles.body12(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                spacing: 6,
                children: [
                  Text(
                    item.price != null ? 'R\$ ${item.price!.toStringAsFixed(2)}' : 'indisponível',
                    style: UiTextStyles.body12(color: UiThemeColors.secondaryText),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: _buildActionButton(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildActionButton() {
    if (cartStore == null || item.id == null) {
      return CatalogCartAdd(onAddToCart: onAddToCart);
    }

    return ListenableBuilder(
      listenable: cartStore!,
      builder: (context, _) {
        final quantity = cartStore!.getProductQuantity(item.id!);

        if (quantity == 0) {
          return CatalogCartAdd(onAddToCart: onAddToCart);
        }

        return ProductQuantityControl(
          quantity: quantity,
          onIncrement: () => onQuantityIncrement?.call(quantity + 1),
          onDecrement: () => onQuantityDecrement?.call(quantity - 1),
        );
      },
    );
  }
}
