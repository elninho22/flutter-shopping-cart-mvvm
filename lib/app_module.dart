import 'package:flutter_modular/flutter_modular.dart';
import 'exports.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => OnboardingStore());

    super.binds(i);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: CatalogModule());

    super.routes(r);
  }
}
