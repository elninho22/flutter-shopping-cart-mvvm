import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../exports.dart';

class CatalogPage extends StatefulWidget {
  final CatalogViewModel viewModel;
  final CartViewModel cartViewModel;
  final CartStore cartStore;

  const CatalogPage({
    super.key,
    required this.viewModel,
    required this.cartViewModel,
    required this.cartStore,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogViewModel get _viewModel => widget.viewModel;
  CartViewModel get _cartViewModel => widget.cartViewModel;
  CartStore get _cartStore => widget.cartStore;
  final UiBottomSheet _bottomSheet = Modular.get<UiBottomSheet>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _viewModel.getProductsCommand.run();
    });
    _cartViewModel.addToCartCommand.addListener(_onAddToCartChanged);
  }

  @override
  void dispose() {
    _cartViewModel.addToCartCommand.removeListener(_onAddToCartChanged);
    super.dispose();
  }

  void _onAddToCartChanged() {
    if (!mounted) {
      return;
    }

    if (_cartViewModel.addToCartCommand.isFailure) {
      _bottomSheet.show(
        context: context,
        type: BottomSheetType.error,
        title: 'Limite atingido',
        message: _cartViewModel.addToCartCommand.errorOrNull?.toString() ?? 'Ocorreu um erro desconhecido.',
        action: 'Fechar',
      );
    }
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: _cartStore,
    builder: (context, _) => RefreshIndicator(
      onRefresh: () => _viewModel.getProductsCommand.run(),
      child: ListenableBuilder(
        listenable: _viewModel.getProductsCommand,
        builder: (context, _) {
          if (_viewModel.getProductsCommand.isExecuting) {
            return const UiShimmer();
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: _viewModel.items.length,
            itemBuilder: (context, index) {
              final product = _viewModel.items[index];

              return CartalogItens(
                item: product,
                onAddToCart: _cartStore.canEdit ? () => _cartViewModel.addToCartCommand.run(product) : null,
                cartStore: _cartStore,
                onQuantityIncrement: (newQuantity) => _cartViewModel.updateQuantityCommand.run(
                  (productId: product.id ?? '', quantity: newQuantity),
                ),
                onQuantityDecrement: (newQuantity) => _cartViewModel.updateQuantityCommand.run(
                  (productId: product.id ?? '', quantity: newQuantity),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}
