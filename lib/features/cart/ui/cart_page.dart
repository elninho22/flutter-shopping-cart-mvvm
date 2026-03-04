import 'package:flutter/material.dart';
import '../../../../core/result.dart';
import '../../../exports.dart';
import 'cart_view_model.dart';

class CartScreen extends StatelessWidget {
  final CartViewModel viewModel;

  const CartScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Seu Carrinho')),
      body: ListenableBuilder(
        listenable: Listenable.merge([
          viewModel,
          viewModel.removeProductCommand,
        ]),
        builder: (context, _) {
          final items = viewModel.items;

          final isRemoving = viewModel.removeProductCommand.isExecuting;
          final result = viewModel.removeProductCommand.result;

          if (items.isEmpty) {
            return const Center(child: Text('Seu carrinho está vazio.'));
          }

          return Column(
            children: [
              if (result is Failure)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    result.error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return CartItemTile(
                      item: item,
                      isRemoving: isRemoving,
                      onRemove: () {
                        viewModel.removeProductCommand.execute(item.product.id);
                      },
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(24),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'preco',
                      // '\$${viewModel.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
}

class _CartFooter extends StatelessWidget {
  final double totalPrice;

  const _CartFooter({
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
}






class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback? onRemove;
  final bool isRemoving;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onRemove,
    required this.isRemoving,
  });

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(item.product.description),
      subtitle: Text(
        'Qtd: ${item.quantity} • \$${item.product.price.toStringAsFixed(2)}',
      ),
      trailing: IconButton(
        onPressed: isRemoving ? null : onRemove,
        icon: isRemoving
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.delete),
      ),
    );
}