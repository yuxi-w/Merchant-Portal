import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/views/aboutpage/about_page_view.dart';
import 'package:merchant_app/views/category/category_view.dart';
import 'package:merchant_app/views/discussion/discussion_view.dart';
import 'package:merchant_app/views/editpersonalinfo/edit_personal_info_view.dart';
import 'package:merchant_app/views/home/home_view.dart';
import 'package:merchant_app/views/invoice/invoice_view.dart';
import 'package:merchant_app/views/login/login_view.dart';
import 'package:merchant_app/views/merchantportal/add_item/add_item.dart';
import 'package:merchant_app/views/merchantportal/edit_item/edit_item_view.dart';
import 'package:merchant_app/views/merchantportal/merchant_portal_view.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item.dart';
import 'package:merchant_app/views/merchantportal/user_order_history/user_order_history.dart';
import 'package:merchant_app/views/order_history/order_history_view.dart';
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

    case MerchantPortalRoute:
      return _getPageRoute(settings, const MerchantPortalView());

    case InvoiceRoute:
      return _getPageRoute(
          settings,
          InvoiceView(
              userShoppingBag: settings.arguments as List<ShoppingItem>));

    case AddItemRoute:
      return _getPageRoute(settings, const AddItemView());

    case RemoveItemRoute:
      return _getPageRoute(settings, const RemoveItemView());

    case EditItemRoute:
      return _getPageRoute(settings,
          EditItemView(shoppingItem: settings.arguments as ShoppingItem));

    /// For Client
    case OrderHistoryRoute:
      return _getPageRoute(settings, const OrderHistoryView());

    /// For Merchant Portal
    case UserOrderHistoryRoute:
      return _getPageRoute(settings, const UserOrderHistoryView());
  }
}

PageRoute? _getPageRoute(RouteSettings settings, Widget child) {
  return MaterialPageRoute(settings: settings, builder: (context) => child);
}
