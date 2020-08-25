import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  static Future<dynamic> navigateTo(Route<Object> route) {
    return navigatorKey.currentState.pushReplacement(route);
  }

  static Future<dynamic> goTo(Route<Object> route) {
    return navigatorKey.currentState.push(route);
  }
}
