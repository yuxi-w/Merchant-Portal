import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

/// Shopping Cart Page
class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  late Future<List<UserInfo>> futureUserInfo;
  late Future<List<ShoppingItem>> futureShoppingItems;

  List<UserInfo>? userInfo = [];
  List<ShoppingItem>? allShoppingItems = [];
  List<dynamic>? userShoppingBagIds = [];
  List<ShoppingItem> userShoppingItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Shopping Cart"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Shopping Cart",
            textAlign: TextAlign.right,
            key: Key("shoppingMainTitle"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),

        /// Main List View
        Container(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 1000),
            child: FutureBuilder(
              future: futureUserInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("dataSnapShot ${snapshot.data}");
                  var temp1 = addShoppingBag();
                  if (temp1.isNotEmpty) {
                    return ShopCartListView(
                        userShoppingItems: addShoppingBag());
                  } else {
                    return const SizedBox(
                        height: 500,
                        child:
                            Center(child: Text("Your shopping cart is empty")));
                  }
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load cart'));
                } else {
                  return const SizedBox(
                      height: 500,
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            )),

        /// Text Showing Total Amount to Pay
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(10, 20, 100, 10),
          child: const Text(
            "Subtotal: \$200.00",
            key: Key("totalAmountText"),
            style: TextStyle(color: Colors.black, fontSize: 30),
            textAlign: TextAlign.right,
          ),
        ),

        /// The Checkout Button
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(10, 0, 120, 40),
          child: MaterialButton(
            minWidth: 200,
            onPressed: () {},
            child: const Text(
              "Checkout!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            height: 52,
            elevation: 24,
            color: Colors.amber.shade700,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            key: const Key("checkOutButton"),
          ),
        ),

        /// Home Page Footer
        const HomePageFooter(),
      ],
    );
  }

  /// Getting User Information
  Future<List<UserInfo>> getUserInfo(int userId) async {
    final response = await get(Uri.parse('${baseUrl}shopuser/$userId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("getting user successful");
      return UserInfo.fromListJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load todo');
    }
  }

  /// Getting All Shopping Items
  Future<List<ShoppingItem>> getShoppingItems() async {
    final response = await get(Uri.parse('${baseUrl}shopitem'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("getting shop items successful");
      return ShoppingItem.fromListJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load todo');
    }
  }

  @override
  void initState() {
    super.initState();

    /// Getting values from future data
    futureUserInfo = getUserInfo(1);
    futureShoppingItems = getShoppingItems();

    /// Get All shopping items
    futureShoppingItems.then((value) {
      allShoppingItems = value;

      /// Get User Data
      futureUserInfo.then((value) {
        userInfo = value;

        if (userInfo?[0].shoppingBag != null) {
          userShoppingBagIds = userInfo?[0].shoppingBag;
        }

        print("AllShopItems ${allShoppingItems.toString()}");
        print("UserItemsIDs ${userShoppingBagIds.toString()}");
      });
    });
  }

  /// Adding Items That User Selected
  List<ShoppingItem> addShoppingBag() {
    userShoppingItems.clear();
    if (userShoppingBagIds != null && allShoppingItems != null) {
      for (ShoppingItem shoppingItem in allShoppingItems!) {
        for (int itemId in userShoppingBagIds!) {
          if (shoppingItem.id == itemId) {
            userShoppingItems.add(shoppingItem);
          }
        }
      }
    }
    print("UserBag ${userShoppingItems.toString()}");
    return userShoppingItems;
  }
}
