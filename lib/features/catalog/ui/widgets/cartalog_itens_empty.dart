import 'package:flutter/material.dart';

import '../../../../exports.dart';

class CartalogItensEmpty extends StatelessWidget {
  final Product item;

  const CartalogItensEmpty({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(item.description ?? ''),
    subtitle: Text(
      '\$${item.price?.toStringAsFixed(2)}',
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