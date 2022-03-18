import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/dialog_payment_option/dialog_payment_option.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

/// Shopping Cart Page
class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  late Future<List<UserInfo>> futureUserInfo;
  late UserInfo userInfo;

  var dynamicShoppingBag = [];
  List<ShoppingItem> userShoppingBag = [];
  bool isUserExist = false;

  @override
  Widget build(BuildContext context) {
    if (globals.isLoggedIn) {
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
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),

          /// Main List View
          Container(
              constraints: const BoxConstraints(
                  minHeight: 300, minWidth: 300, maxWidth: 1000),
              child: FutureBuilder(
                future: futureUserInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("dataSnapShot ${snapshot.data}");
                    return ShopCartListView(futureUserInfo: futureUserInfo);
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
          calculateTotalPrice(),

          /// The Checkout Button
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(10, 0, 120, 40),
            child: MaterialButton(
              minWidth: 200,
              onPressed: () {
                checkUserBag();
              },
              child: const Text(
                "Checkout!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              height: 52,
              elevation: 24,
              color: Colors.amber.shade700,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              key: const Key("checkOutButton"),
            ),
          ),

          /// Home Page Footer
          const HomePageFooter(),
        ],
      );
    } else {
      return ListView(
        children: [
          /// Top Navigation Bar
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
            child: const MyNavigationBar(),
          ),

          Container(
            constraints: const BoxConstraints(
                minHeight: 350, minWidth: 300, maxWidth: 1000),
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(70, 20, 10, 110),
            child: const Text(
              "Please login to view your Shopping Cart",
              textAlign: TextAlign.right,
              key: Key("notLoggedInText_shoppingCart"),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const HomePageFooter()
        ],
      );
    }
  }

  /// Getting User Information From API
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
      throw Exception('Failed to load user info');
    }
  }

  void checkUserBag() {
    if (userShoppingBag.isNotEmpty && isUserExist == true) {
      ///Show Payment Dialog
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              DialogPaymentOption(context, userInfo, userShoppingBag)
                  .createDialog());
    } else {
      ///Show Hint Dialog
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              DialogMessage(context, "No Item in Cart", "").createDialog());
    }
  }

  /// Method For Calculating Total Price
  FutureBuilder<List<UserInfo>> calculateTotalPrice() {
    return FutureBuilder(
      future: futureUserInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapData ${snapshot.data}");

          /// Get User Info
          var tempUserInfo = snapshot.data as List<UserInfo>;
          userInfo = tempUserInfo[0];
          isUserExist = true;

          /// Get User Shopping Bag
          if (userInfo.shoppingBag!.isNotEmpty) {
            List<String> priceList = [];
            dynamicShoppingBag =
                ShoppingItem.fromListJson(userInfo.shoppingBag!);
            userShoppingBag = dynamicShoppingBag as List<ShoppingItem>;

            /// Adding Prices to Price List
            userShoppingBag.forEach((element) {
              priceList.add(element.price!);
            });

            print("PricesList ${priceList.toString()}");

            /// Sum Prices
            int totalPrice = 0;
            priceList.forEach((element) {
              totalPrice += int.parse(element);
            });

            /// Showing Total Price
            return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(10, 20, 115, 10),
              child: Text(
                "Subtotal: \$${totalPrice.toString()}",
                key: const Key("totalAmountText"),
                style: const TextStyle(color: Colors.black, fontSize: 30),
                textAlign: TextAlign.right,
              ),
            );
          } else {
            return const Center(
                child: Text(
              "\$0",
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed To Load Data'));
        } else {
          return const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  @override
  void initState() {
    if (globals.isLoggedIn) {
      super.initState();
      futureUserInfo = getUserInfo(globals.id);
    }
  }
}
