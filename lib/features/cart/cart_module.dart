import 'package:flutter_modular/flutter_modular.dart';
import '../../exports.dart';

class CartModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => CartPage(viewModel: Modular.get<CartViewModel>()),
    );
  }
}
