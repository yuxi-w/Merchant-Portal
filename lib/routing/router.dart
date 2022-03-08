import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/views/aboutpage/about_page_view.dart';
import 'package:merchant_app/views/category/category_view.dart';
import 'package:merchant_app/views/discussion/discussion_view.dart';
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
      return _getPageRoute(settings, const HomeView());

    case CategoryRoute:
      return _getPageRoute(settings, const CategoryView());

    case ShoppingCartRoute:
      return _getPageRoute(settings, const ShoppingCartView());

    case PersonalInfoRoute:
      return _getPageRoute(settings, const PersonalInfoView());

    case EditPersonalInfoRoute:
      return _getPageRoute(settings, const EditPersonalInfoView());

    case LoginRoute:
      return _getPageRoute(settings, const LoginView());

    case SignUpRoute:
      return _getPageRoute(settings, const SignUpPageView());

    case ProductDetailRoute:
      return _getPageRoute(settings,
          ProductDetailView(shoppingItem: settings.arguments as ShoppingItem));

    case AboutRoute:
      return _getPageRoute(settings, const AboutView());

    case DiscussionRoute:
      return _getPageRoute(settings, const DiscussionView());
  }
}

PageRoute? _getPageRoute(RouteSettings settings, Widget child) {
  return MaterialPageRoute(settings: settings, builder: (context) => child);
}
