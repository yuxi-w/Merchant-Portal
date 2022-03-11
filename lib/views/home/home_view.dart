import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/home/home_content_desktop.dart';
import 'package:merchant_app/views/home/home_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart';

/// This is our Home Page
class HomeView extends StatefulWidget {
  const HomeView({BuildContext? appContext, Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<ShoppingItem>> futureShoppingItems;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          /// Top Navigation Bar
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Home"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Home",
            textAlign: TextAlign.right,
            key: Key("homeMainTitle"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),

        /// Main Content is a List which shows the products in Home Page
        ScreenTypeLayout(
          mobile: HomeContentMobile(futureShoppingItems: futureShoppingItems),
          desktop: HomeContentDesktop(futureShoppingItems: futureShoppingItems),
        ),

        /// Page Footer
        const HomePageFooter()
      ],
    );
  }

  Future<List<ShoppingItem>> getShoppingItems() async {
    final response = await get(Uri.parse('${baseUrl}shopitem'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ShoppingItem.fromListJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load shopping list');
    }
  }

  @override
  void initState() {
    super.initState();
    futureShoppingItems = getShoppingItems();
  }
}
