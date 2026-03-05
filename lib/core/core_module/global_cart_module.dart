import 'package:flutter_modular/flutter_modular.dart';
import '../../exports.dart';

class GlobalCartModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<CartStore>(() => CartStore());
    i.addLazySingleton<CartService>(() => CartService());
    i.addLazySingleton<CartRepositoryImpl>(
      () => CartRepositoryImpl(Modular.get<CartService>()),
    );
    i.addLazySingleton<CartRepository>(
      () => Modular.get<CartRepositoryImpl>(),
    );
    i.addLazySingleton<CartViewModel>(
      () => CartViewModel(
        Modular.get<CartStore>(),
        Modular.get<CartRepository>(),
      ),
    );
  }

  @override
  void binds(Injector i) {
    super.binds(i);
  }
}
