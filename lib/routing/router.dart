import 'package:flutter/material.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/views/category/category_view.dart';
import 'package:merchant_app/views/home/home_view.dart';
import 'package:merchant_app/views/login/login_view.dart';
import 'package:merchant_app/views/personalinfo/personal_info_view.dart';
import 'package:merchant_app/views/shoppingcart/shopping_cart_view.dart';

/// This is the dynamic top level function that is used in Layout Holder Page
/// In order to generate routes
Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeView());
    case CategoryRoute:
      return _getPageRoute(const CategoryView());
    case ShoppingCartRoute:
      return _getPageRoute(const ShoppingCartView());
    case PersonalInfoRoute:
      return _getPageRoute(const PersonalInfoView());
    case LoginRoute:
      return _getPageRoute(const LoginView());
  }
}

PageRoute? _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
