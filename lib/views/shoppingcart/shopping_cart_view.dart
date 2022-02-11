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
        /// A list so multiple widgets can be added here
        Container(
          color: Colors.black12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Top Navigation Bar
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
                child: const MyNavigationBar(),
              ),

              /// The Text Showing "Shopping Cart"
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
                child: const Text("My Shopping Cart",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                    textAlign: TextAlign.right),
              ),

              /// Main List View
              Container(
                constraints:
                    const BoxConstraints(minWidth: 300, maxWidth: 1000),
                // padding: EdgeInsets.fromLTRB(500, 10, 500, 10),
                child: const ShopCartListView(),
              ),

              /// Text Showing Total Amount to Pay
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(10, 20, 100, 10),
                child: const Text("Subtotal: \$200.00",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    textAlign: TextAlign.right),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),

              /// Home Page Footer
              const HomePageFooter()
            ],
          ),
        ),
      ],
    );
  }
}
