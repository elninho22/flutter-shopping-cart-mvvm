import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CartSummary extends StatelessWidget {
  final CartStore cartStore;

  const CartSummary({super.key, required this.cartStore});

  double get subtotal => cartStore.items.fold(
    0,
    (sum, item) => sum + ((item.product.price ?? 0) * item.quantity),
  );

  double get total => subtotal;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[50],
      border: const Border(
        top: BorderSide(color: UiThemeColors.neutral90),
      ),
    ),
    child: Column(
      spacing: 12,
      children: [
        _Summary(
          label: 'Quantidade de itens:',
          value: '${cartStore.itemCount}',
        ),
        _Summary(
          label: 'Subtotal:',
          value: 'R\$ ${subtotal.toStringAsFixed(2)}',
        ),
        const _Summary(
          label: 'Frete:',
          value: 'Grátis',
        ),
        _Summary(
          label: 'Total:',
          value: 'R\$ ${total.toStringAsFixed(2)}',
          isTotal: true,
        ),
      ],
    ),
  );
}

class _Summary extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _Summary({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: UiTextStyles.body14(
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      Text(
        value,
        style: UiTextStyles.body14(
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}
