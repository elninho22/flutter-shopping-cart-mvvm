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
  String get _title =>
      Modular.to.path.endsWith('/cart') ? 'Carrinho' : 'Catálogo';

  @override
  void initState() {
    super.initState();
    Modular.to.addListener(_onRouteChange);
  }

  @override
  void dispose() {
    Modular.to.removeListener(_onRouteChange);
    super.dispose();
  }

  void _onRouteChange() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: widget.cartStore,
        builder: (context, _) {
          final cartStore = widget.cartStore;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                _title,
                style: UiTextStyles.heading20(),
              ),
              leading: Modular.to.path.endsWith('/cart')
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Modular.to.navigate('/catalog'),
                    )
                  : null,
              actions: [
                IconButton(
                  icon: Badge(
                    label: Text('${cartStore.itemCount}'),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  onPressed: () => Modular.to.navigate('/cart'),
                ),
              ],
            ),
            body: const RouterOutlet(),
          );
        },
      );
}
