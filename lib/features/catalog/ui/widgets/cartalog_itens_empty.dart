import 'package:flutter/material.dart';

import '../../../../exports.dart';

class CartalogItensEmpty extends StatelessWidget {
  final CatalogModel item;

  const CartalogItensEmpty({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(item.product.description),
    subtitle: Text(
      'Qtd: ${item.quantity} • \$${item.product.price.toStringAsFixed(2)}',
    ),
    trailing: IconButton(
      onPressed: () {},
      icon: const SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    ),
  );
}