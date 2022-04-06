import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/category/category_content_desktop.dart';
import 'package:merchant_app/views/category/category_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// This is our Category Page
class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<List<ShoppingItem>> futureShoppingItems;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Category page"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Category",
            textAlign: TextAlign.right,
            key: Key("categoryMainTitle"),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),

        /// Main Content and products on category page
        FutureBuilder(
          future: futureShoppingItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ///Getting All Items
              var allShoppingItems = snapshot.data as List<ShoppingItem>;
              if (allShoppingItems.isNotEmpty) {
                ///Getting Category Names
                Set<String> categoryNames = {};
                allShoppingItems.forEach((element) {
                  categoryNames.add(element.category!.toLowerCase());
                });
                return ScreenTypeLayout(
                  mobile: CategoryContentMobile(
                      shoppingItemList: allShoppingItems,
                      categoryNameList: categoryNames.toList()),
                  desktop: CategoryContentDesktop(
                      shoppingItemList: allShoppingItems,
                      categoryNameList: categoryNames.toList()),
                );
              } else {
                return const SizedBox(
                    height: 500,
                    child: Center(
                        child: Text(
                      "Items Not Available",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )));
              }
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed To Load Data'));
            } else {
              return const SizedBox(
                  height: 500,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
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
      throw Exception('Failed to load shopping items');
    }
  }

  @override
  void initState() {
    super.initState();
    futureShoppingItems = getShoppingItems();
  }
}
