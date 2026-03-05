import 'package:flutter_modular/flutter_modular.dart';

import '../../exports.dart';

class CatalogModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<CatalogService>(
      () => CatalogService(
        Modular.get<RestClient>(),
      ),
    );

    i.addLazySingleton<CatalogRepositoryImpl>(
      () => CatalogRepositoryImpl(
        Modular.get<CatalogService>(),
      ),
    );

     i.addLazySingleton<CatalogRepository>(
      () => Modular.get<CatalogRepositoryImpl>(),
    );
    i.add(CatalogViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => CatalogPage(
        viewModel: Modular.get<CatalogViewModel>(),
        cartViewModel: Modular.get<CartViewModel>(),
        cartStore: Modular.get<CartStore>(),
      ),
    );
  }
}
