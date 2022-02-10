import 'package:flutter/material.dart';

/// Navigation service to switch between pages
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
