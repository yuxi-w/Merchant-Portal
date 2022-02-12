import 'package:flutter/material.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/views/category/category_view.dart';
import 'package:merchant_app/views/editpersonalinfo/edit_personal_info_view.dart';
import 'package:merchant_app/views/home/home_view.dart';
import 'package:merchant_app/views/login/login_view.dart';
import 'package:merchant_app/views/personalinfo/personal_info_view.dart';
import 'package:merchant_app/views/productdetail/product_detail_view.dart';
import 'package:merchant_app/views/shoppingcart/shopping_cart_view.dart';
import 'package:merchant_app/views/signup/sign_up_view.dart';

/// This is the dynamic top level function that is to generate routes
/// and switch between pages
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

    case EditPersonalInfoRoute:
      return _getPageRoute(const EditPersonalInfoView());

    case LoginRoute:
      return _getPageRoute(const LoginView());

    case SignUpRoute:
      return _getPageRoute(const SignUpPageView());

    case ProductDetailRoute:
      return _getPageRoute(const ProductDetailView());
  }
}

PageRoute? _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
