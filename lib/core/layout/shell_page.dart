
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../exports.dart';

class ShellPage extends StatefulWidget {
  final CartStore cartStore;

  const ShellPage({super.key, required this.cartStore});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  String get _title {
    final routeName = ModalRoute.of(context)?.settings.name ?? '';
    return routeName.endsWith('/cart') ? 'Carrinho' : 'Catálogo';
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: widget.cartStore,
        builder: (context, _) {
          final cartStore = widget.cartStore;
          final routeName = ModalRoute.of(context)?.settings.name ?? '';
          final isCart = routeName.endsWith(AppRoutes.cart);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                _title,
                style: UiTextStyles.heading20(),
              ),
              leading: isCart
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.catalog),
                    )
                  : null,
              actions: [
                IconButton(
                  icon: Badge(
                    label: Text('${cartStore.itemCount}'),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.cart),
                ),
              ],
            ),
            body: _buildBody(isCart),
          );
        },
      );

  Widget _buildBody(bool isCart) {
    if (isCart) {
      return CartPage(viewModel: Modular.get<CartViewModel>());
    } else {
      return CatalogPage(
        viewModel: Modular.get<CatalogViewModel>(),
        cartViewModel: Modular.get<CartViewModel>(),
        cartStore: widget.cartStore,
      );
    }
  }
}
