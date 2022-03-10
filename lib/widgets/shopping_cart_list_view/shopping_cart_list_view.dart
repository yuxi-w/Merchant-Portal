import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

/// Shopping cart item list
class ShopCartListView extends StatefulWidget {
  final List<ShoppingItem> userShoppingItems;

  const ShopCartListView({Key? key, required this.userShoppingItems})
      : super(key: key);

  @override
  _ShopCartListViewState createState() => _ShopCartListViewState();
}

class _ShopCartListViewState extends State<ShopCartListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.userShoppingItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ShopCartListItem((widget.userShoppingItems)[index]);
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    print("inKoskesh koooo ${widget.userShoppingItems.toString()}");
  }
}
