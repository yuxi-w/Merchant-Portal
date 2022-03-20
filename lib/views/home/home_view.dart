import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

/// This is the Home Page
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
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
    try {
      final response = await get(Uri.parse('${baseUrl}shopitem'))
          .timeout(const Duration(seconds: 5), onTimeout: () {
        print("timedout");
        throw TimeoutException('Can\'t connect in 5 seconds.');
      });
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return ShoppingItem.fromListJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load shopping list');
      }
    } catch (e) {
      print("here");
      if (baseUrl == "http://ec2-100-26-134-56.compute-1.amazonaws.comasd/") {
        baseUrl = "https://merchant-api.azurewebsites.net/";
        final newresponse = await get(Uri.parse('${baseUrl}shopitem'));
        if (newresponse.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          return ShoppingItem.fromListJson(jsonDecode(newresponse.body));
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load shopping list');
        }
      } else {
        baseUrl = "http://ec2-100-26-134-56.compute-1.amazonaws.com/";
        final newresponse = await get(Uri.parse('${baseUrl}shopitem'));
        if (newresponse.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          return ShoppingItem.fromListJson(jsonDecode(newresponse.body));
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load shopping list');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    futureShoppingItems = getShoppingItems();
  }
}
