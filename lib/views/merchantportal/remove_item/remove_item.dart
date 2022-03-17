import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item_content_desktop.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RemoveItemView extends StatefulWidget {
  const RemoveItemView({Key? key}) : super(key: key);

  @override
  State<RemoveItemView> createState() => _RemoveItemViewState();
}

class _RemoveItemViewState extends State<RemoveItemView> {
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

        /// The Text Showing "Remove Item"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Edit & Remove Item",
            textAlign: TextAlign.right,
            key: Key("main_remove_item_title"),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),

        /// Main Content is a List which shows the products in Remove Page
        ScreenTypeLayout(
          mobile:
              RemoveItemContentMobile(futureShoppingItems: futureShoppingItems),
          desktop: RemoveItemContentDesktop(
              futureShoppingItems: futureShoppingItems),
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
