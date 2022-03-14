import 'package:flutter/material.dart';

/// Navigation service to switch between pages
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName, dynamic data) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: data);
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
