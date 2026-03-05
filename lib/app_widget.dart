
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    Modular.setInitialRoute('/catalog');
    Modular.setNavigatorKey(NavigatorHelper.nav);
  }


  @override
  Widget build(BuildContext context) =>  LayoutBuilder(
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

MaterialApp appMaterialApp() => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ConstStrings.appName,
      theme: UiConfigDefault.theme,
      locale: const Locale('pt', 'BR'),
      routerConfig: Modular.routerConfig,
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
              right: 20,
              top: 40,
              child: Align(
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.blue.withValues(alpha: 0.25),
                  onPressed: () => Modular.to.push(
                    MaterialPageRoute(
                      builder: (context) => const ViewLogsConsole(),
                    ),
                  ),
                  child: Icon(Icons.build, color: Colors.white.withValues(alpha: 0.25)),
                ),
              ),
            ),
          ],
        ),
      );
}
