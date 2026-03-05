import 'package:flutter/material.dart';

class CatalogCartAdd extends StatelessWidget {
  final VoidCallback? onAddToCart;

  const CatalogCartAdd({
    super.key,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: onAddToCart,
    icon: const Icon(Icons.add_shopping_cart),
  );
}
