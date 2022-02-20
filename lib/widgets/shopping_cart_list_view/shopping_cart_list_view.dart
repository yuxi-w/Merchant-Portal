import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

/// Shopping cart item list
class ShopCartListView extends StatefulWidget {
  const ShopCartListView({Key? key}) : super(key: key);

  @override
  _ShopCartListViewState createState() => _ShopCartListViewState();
}

class _ShopCartListViewState extends State<ShopCartListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          ShopCartListItem("The Dart Programming Language", '\$50.00',
              "ISBN-13: 978-0321927705", 2, "assets/electronics.png"),
          ShopCartListItem("Deep Learning", '\$100.00',
              "ISBN-13: 978-0262035613", 1, "assets/electronics.png"),
        ],
      ),
    );
  }
}
