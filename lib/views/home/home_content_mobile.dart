import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

/// Home Page Layout for mobile screens or when the screen shrinks
class HomeContentMobile extends StatefulWidget {
   const HomeContentMobile({Key? key, required this.futureShoppingItems})
      : super(key: key);

  final Future<List<ShoppingItem>> futureShoppingItems;

  @override
  _HomeContentMobileState createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Flexible(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            HomePageListItem("Product 1", '\$50',
                "Description about the product 1", "assets/electronics.png"),
            HomePageListItem("Product 2", '\$70',
                "Description about the product 2", "assets/electronics.png"),
            HomePageListItem("Product 3", '\$60',
                "Description about the product 3", "assets/electronics.png"),
            HomePageListItem("Product 4", '\$80',
                "Description about the product 4", "assets/electronics.png"),
            HomePageListItem("Product 5", '\$50',
                "Description about the product 5", "assets/electronics.png"),
            HomePageListItem("Product 6", '\$80',
                "Description about the product 6", "assets/electronics.png"),
            HomePageListItem("Product 7", '\$100',
                "Description about the product 7", "assets/electronics.png"),
            HomePageListItem("Product 8", '\$20',
                "Description about the product 8", "assets/electronics.png"),
          ],
        ),
      ),
    );
  }
}
