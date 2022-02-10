// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

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
            ShopCartListItem(
                "The Dart Programming Language", '\$50.00', "ISBN-13: 978-0321927705", 2,
                'https://m.media-amazon.com/images/I/51cH0WD2rRL._AC_UL480_FMwebp_QL65_.jpg'),
            
            ShopCartListItem(
                "Deep Learning", '\$100.00', "ISBN-13: 978-0262035613", 1,
                'https://m.media-amazon.com/images/I/A1GbblX7rOL._AC_AA180_.jpg'),
            ],
        ),
      ),
    );
  }
}
