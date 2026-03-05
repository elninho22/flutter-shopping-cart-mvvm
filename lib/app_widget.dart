import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/routes/routes_export.dart';
import 'exports.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => OrientationBuilder(
      builder: (context, orientation) {
        if (kDebugMode) {
          return const AppLogsApplication();
        }
        return appMaterialApp();
      },
    ),
  );
}

MaterialApp appMaterialApp() => MaterialApp(
  navigatorKey: NavigatorHelper.nav,
  debugShowCheckedModeBanner: false,
  title: ConstStrings.appName,
  theme: UiConfigDefault.theme,
  locale: const Locale('pt', 'BR'),
  initialRoute: AppRoutes.catalog,
  routes: {
    AppRoutes.catalog: (context) => ShellPage(cartStore: Modular.get<CartStore>()),
    AppRoutes.cart: (context) => ShellPage(cartStore: Modular.get<CartStore>()),
    AppRoutes.orderConfirmation: (context) => const OrderConfirmationPage(),
    AppRoutes.debug: (context) => const ViewLogsConsole(),
  },
);

class AppLogsApplication extends StatelessWidget {
  const AppLogsApplication({super.key});

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.ltr,
    child: Stack(
      children: [
        appMaterialApp(),
        Positioned(
          right: 100,
          top: 20,
          child: Align(
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.blue.withValues(alpha: 0.25),
              onPressed: () => NavigatorHelper.nav.currentState?.pushNamed(AppRoutes.debug),

              child: Icon(Icons.build, color: Colors.white.withValues(alpha: 0.25)),
            ),
          ),
        ),
      ],
    ),
  );
}
