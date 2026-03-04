import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../exports.dart';


class DebugApp {
  DebugApp._();

  static void http({
    required String label,
    required dynamic error,
    dynamic stackTrace,
  }) {
    if (kDebugMode) {
      final store = Modular.get<OnboardingStore>();
      store.setError(
        label: label,
        error: error,
        stackTrace: stackTrace,
        typeError: 'APP_HTTP',
      );
    }
  }
}
