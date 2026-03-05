import 'package:flutter/material.dart';

import '../../../../core/ui_theme/ui_library.dart';

class ProductQuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductQuantityControl({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: UiThemeColors.white,
          border: Border.all(color: UiThemeColors.neutral90),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 12,
              icon: const Icon(Icons.remove),
              onPressed: onDecrement,
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
            Text(
              quantity.toString(),
              style: UiTextStyles.body12(fontWeight: FontWeight.bold)
            ),
            IconButton(
              iconSize: 12,
              icon: const Icon(Icons.add),
              onPressed: onIncrement,
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      );
}