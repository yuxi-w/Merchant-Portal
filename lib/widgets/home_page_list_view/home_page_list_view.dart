// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({Key? key}) : super(key: key);

  @override
  _HomePageListViewState createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          HomePageListItem(
              "Product 1", '\$50', "Description about the product 1"),
          HomePageListItem(
              "Product 2", '\$70', "Description about the product 2"),
          HomePageListItem(
              "Product 3", '\$60', "Description about the product 3"),
          HomePageListItem(
              "Product 4", '\$80', "Description about the product 4"),
          HomePageListItem(
              "Product 5", '\$50', "Description about the product 5"),
          HomePageListItem(
              "Product 6", '\$80', "Description about the product 6"),
          HomePageListItem(
              "Product 7", '\$100', "Description about the product 7"),
          HomePageListItem(
              "Product 8", '\$20', "Description about the product 8"),
          HomePageListItem(
              "Product 9", '\$30', "Description about the product 9"),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      ),
    );
  }
}
