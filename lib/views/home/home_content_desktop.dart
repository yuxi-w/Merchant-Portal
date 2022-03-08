import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

/// Home Page Layout for desktop screen
class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key? key, required this.futureShoppingItems})
      : super(key: key);

  final Future<List<ShoppingItem>> futureShoppingItems;

  @override
  _HomeContentDesktopState createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Flexible(
        child: GridView(
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
      ),
    );
  }
}
