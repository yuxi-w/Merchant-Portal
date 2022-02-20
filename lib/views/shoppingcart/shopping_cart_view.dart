import 'package:flutter/material.dart';
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
            "My Shopping Cart",
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
          child: const ShopCartListView(),
        ),

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
}
