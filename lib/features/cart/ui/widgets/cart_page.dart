import 'package:flutter/material.dart';

import '../../../../exports.dart';

class CartPage extends StatefulWidget {
  final CartViewModel viewModel;
  const CartPage({super.key, required this.viewModel});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartViewModel get _vm => widget.viewModel;

  @override
  void initState() {
    super.initState();
    _vm.finalizeCartCommand.addListener(_onFinalizeChanged);
  }

  @override
  void dispose() {
    _vm.finalizeCartCommand.removeListener(_onFinalizeChanged);
    super.dispose();
  }

  void _onFinalizeChanged() {
    if (!mounted) {
      return;
    }

    if (_vm.finalizeCartCommand.isSuccess) {
      _vm.store.reset(); 
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.orderConfirmation,
        (route) => route.settings.name == AppRoutes.catalog,
      );
    } else if (_vm.finalizeCartCommand.isFailure) {
      UiBottomSheetImpl().show(
        context: context,
        type: BottomSheetType.error,
        title: 'Erro ao finalizar',
        message: _vm.finalizeCartCommand.errorOrNull?.toString() ?? 'Ocorreu um erro desconhecido.',
        action: 'Fechar',
        onAction: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.orderConfirmation,
            (route) => route.settings.name == AppRoutes.catalog,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: Listenable.merge([_vm.store, _vm.finalizeCartCommand]),
    builder: (context, _) {
      if (_vm.finalizeCartCommand.isExecuting) {
        return const UiShimmer();
      }

      final store = _vm.store;

      return Column(
        children: [
          Expanded(
            child: CartItemsList(
              items: store.items,
              cartViewModel: _vm,
              isEditable: store.canEdit,
            ),
          ),
          CartSummary(cartStore: store),
          if (store.canEdit && store.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: UiButton.filled(
                expanded: true,
                onPressed: _vm.finalizeCartCommand.isExecuting ? () {} : () => _vm.finalizeCartCommand.run(),
                label: 'Finalizar Pedido',
              ),
            ),
        ],
      );
    },
  );
}
