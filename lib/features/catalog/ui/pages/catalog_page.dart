import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _viewModel.getProductsCommand.run();
    });
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: _cartStore,
        builder: (context, _) => RefreshIndicator(
        onRefresh: () => _viewModel.getProductsCommand.run(),
        child: LoadingDefault(
          isLoading: _viewModel.getProductsCommand.isExecuting,
          child: ListenableBuilder(
            listenable: _viewModel.getProductsCommand,
            builder: (context, _) {
              if (_viewModel.items.isEmpty) {
                return const UiShimmer();
              }
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _viewModel.items.length,
                itemBuilder: (context, index) {
                  final item = _viewModel.items[index];
                  return CartalogItens(
                    item: item,
                    onAddToCart: _cartStore.canEdit
                        ? () => _cartViewModel.addToCartCommand.run(item)
                        : null,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
}
