import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({BuildContext? appContext, Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

/// This is our Home Page
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          ///Top Navigation Bar
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        ///Main Content is a GridView List which shows the products in Home Page
        Container(
          margin: const EdgeInsets.all(16),
          child: Flexible(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: const [
                HomePageListItem("Product 1", '\$50',
                    "Description about the product 1", "assets/sample.png"),
                HomePageListItem("Product 2", '\$70',
                    "Description about the product 2", "assets/sample.png"),
                HomePageListItem("Product 3", '\$60',
                    "Description about the product 3", "assets/sample.png"),
                HomePageListItem("Product 4", '\$80',
                    "Description about the product 4", "assets/sample.png"),
                HomePageListItem("Product 5", '\$50',
                    "Description about the product 5", "assets/sample.png"),
                HomePageListItem("Product 6", '\$80',
                    "Description about the product 6", "assets/sample.png"),
                HomePageListItem("Product 7", '\$100',
                    "Description about the product 7", "assets/sample.png"),
                HomePageListItem("Product 8", '\$20',
                    "Description about the product 8", "assets/sample.png"),
                HomePageListItem("Product 9", '\$30',
                    "Description about the product 9", "assets/sample.png"),
              ],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ),
          ),
        ),

        ///Page Footer
        const HomePageFooter()
      ],
    );
  }
}
