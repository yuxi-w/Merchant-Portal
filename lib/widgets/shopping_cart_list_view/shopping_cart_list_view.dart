// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item1.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item2.dart';

class ShopCartListView extends StatefulWidget {
  const ShopCartListView({Key? key}) : super(key: key);

  @override
  _ShopCartListViewState createState() => _ShopCartListViewState();
}

class _ShopCartListViewState extends State<ShopCartListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Flexible(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ShopCartListItem1(
                "The Dart Programming Language", '\$50.00', "ISBN-13: 978-0321927705", 2),
            
            ShopCartListItem2(
                "Deep Learning", '\$100.00', "ISBN-13: 978-0262035613", 1),
            ],
        ),
      ),
    );
  }
}
