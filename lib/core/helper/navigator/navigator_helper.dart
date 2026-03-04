import 'package:flutter/widgets.dart';

class NavigatorHelper {
  static GlobalKey<NavigatorState> nav = GlobalKey<NavigatorState>();
  static RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
}
