import 'package:flutter/cupertino.dart';

class NavigationService {
  NavigationService._internal() {}

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final NavigationService _singleton = NavigationService._internal();

  static NavigationService get instance => _singleton;

  void pushNamed({required String route}) async {
    await navigatorKey.currentState!.pushNamed(route);
  }

  void pushReplacementNamed({required String route}) async {
    await navigatorKey.currentState!.pushReplacementNamed(route);
  }

  void pop() async {
    navigatorKey.currentState!.pop();
  }
}
