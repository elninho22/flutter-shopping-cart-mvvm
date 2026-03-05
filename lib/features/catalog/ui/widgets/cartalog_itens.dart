import 'package:flutter/material.dart';

import '../../../../exports.dart';

class CartalogItens extends StatelessWidget {
  final Product item;
  final VoidCallback? onAddToCart;

  const CartalogItens({
    super.key,
    required this.item,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(
      item.name ?? '',
      style: UiTextStyles.heading16(),
    ),
    subtitle: Text(
      '${item.description} • \$${item.price?.toStringAsFixed(2)}',
      style: UiTextStyles.body14(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    trailing: IconButton(
      onPressed: onAddToCart,
      icon: const Icon(Icons.add_shopping_cart),
    ),
  );
}
