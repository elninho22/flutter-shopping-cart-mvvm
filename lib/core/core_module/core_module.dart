import 'package:flutter_modular/flutter_modular.dart';
import '../../exports.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<LoggerApp>(
      () => LoggerImpl(),
    );
    i.addLazySingleton<RestClient>(
      () => DioRestClient(
        log: Modular.get<LoggerApp>(),
      ),
    );

    i.addLazySingleton<UiBottomSheet>(
      () => UiBottomSheetImpl(),
    );
    super.binds(i);
  }
}
