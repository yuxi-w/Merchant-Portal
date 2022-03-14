import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

/// Shopping cart item list
class ShopCartListView extends StatefulWidget {
  final Future<List<UserInfo>> futureUserInfo;

  const ShopCartListView({Key? key, required this.futureUserInfo})
      : super(key: key);

  @override
  _ShopCartListViewState createState() => _ShopCartListViewState();
}

class _ShopCartListViewState extends State<ShopCartListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(70, 16, 70, 16),
        child: buildFutureBuilder());
  }

  FutureBuilder<List<UserInfo>> buildFutureBuilder() {
    return FutureBuilder(
      future: widget.futureUserInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapData ${snapshot.data}");
          var tempUserInfo = snapshot.data as List<UserInfo>;
          var userInfo = tempUserInfo[0];
          if (userInfo.shoppingBag!.isNotEmpty) {
            var userShoppingBag =
                ShoppingItem.fromListJson(userInfo.shoppingBag!);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: userShoppingBag.length,
              itemBuilder: (BuildContext context, int index) {
                return ShopCartListItem((userShoppingBag)[index]);
              },
            );
          } else {
            return const Center(
                child: Text(
              "Shopping Bag is empty",
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
}
