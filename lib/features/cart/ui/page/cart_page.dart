import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CartPage extends StatelessWidget {
  final CartViewModel viewModel;

  const CartPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
          listenable: viewModel.store,
          builder: (context, _) {
            final store = viewModel.store;
            if (store.items.isEmpty) {
              return const Center(child: Text('Carrinho vazio'));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: store.items.length,
                    itemBuilder: (context, index) {
                      final item = store.items[index];
                      return ListTile(
                        title: Text(item.product.name ?? ''),
                        subtitle: Text(
                          'Qtd: ${item.quantity} • \$${item.product.price?.toStringAsFixed(2)}',
                        ),
                        trailing: store.canEdit
                            ? IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () =>
                                    viewModel.removeFromCartCommand.run(item.product.id ?? ''),
                              )
                            : null,
                      );
                    },
                  ),
                ),
                if (store.canEdit)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListenableBuilder(
                      listenable: viewModel.finalizeCartCommand,
                      builder: (context, _) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: viewModel.finalizeCartCommand.isExecuting
                              ? null
                              : () => viewModel.finalizeCartCommand.run(),
                          child: viewModel.finalizeCartCommand.isExecuting
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('Finalizar Carrinho'),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}
