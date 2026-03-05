import 'package:flutter/material.dart';
import '../../../../exports.dart';

class CatalogPage extends StatefulWidget {
  final CatalogViewModel viewModel;

  const CatalogPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogViewModel get _viewModelCatalog => widget.viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _viewModelCatalog.getProductsCommand.run();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Catalogo de Produtos',
        style: UiTextStyles.heading20(),
      ),
    ),
    body: LoadingDefault(
      isLoading: _viewModelCatalog.getProductsCommand.isExecuting,
      child: ListenableBuilder(
        listenable: _viewModelCatalog.getProductsCommand,
        builder: (context, _) {
          if (_viewModelCatalog.items.isEmpty) {
            return const UiShimmer();
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _viewModelCatalog.items.length,
            itemBuilder: (context, index) {
              final item = _viewModelCatalog.items[index];
              return CartalogItens(item: item);
            },
          );
        },
      ),
    ),
  );
}
