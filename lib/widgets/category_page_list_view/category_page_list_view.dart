// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'category_page_list_item.dart';

///This class contains the product items in Category page
class CategoryPageListView extends StatefulWidget {
  const CategoryPageListView({Key? key}) : super(key: key);

  @override
  _CategoryPageListViewState createState() => _CategoryPageListViewState();
}

class _CategoryPageListViewState extends State<CategoryPageListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Flexible(
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(
              "Books:",
              style: TextStyle(fontSize: 25),
            ),
            CategoryPageListItem(
                "book 1", "\$10", "Description of book 1", "assets/book.jpeg"),
            CategoryPageListItem(
                "book 2", "\$20", "Description of book 2", "assets/book.jpeg"),
            CategoryPageListItem(
                "book 3", "\$30", "Description of book 3", "assets/book.jpeg"),
            CategoryPageListItem(
                "book 4", "\$40", "Description of book 4", "assets/book.jpeg"),
            CategoryPageListItem(
                "book 5", "\$50", "Description of book 5", "assets/book.jpeg"),
            Text(
              "Clothing:",
              style: TextStyle(fontSize: 25),
            ),
            CategoryPageListItem("cloth 1", "\$10", "Description of cloth 1",
                "assets/clothes.jpeg"),
            CategoryPageListItem("cloth 2", "\$20", "Description of cloth 2",
                "assets/clothes.jpeg"),
            CategoryPageListItem("cloth 3", "\$30", "Description of cloth 3",
                "assets/clothes.jpeg"),
            CategoryPageListItem("cloth 4", "\$40", "Description of cloth 4",
                "assets/clothes.jpeg"),
            CategoryPageListItem("cloth 5", "\$50", "Description of cloth 5",
                "assets/clothes.jpeg"),
            Text(
              "Furniture:",
              style: TextStyle(fontSize: 25),
            ),
            CategoryPageListItem("furniture 1", "\$10",
                "Description of furniture 1", "assets/furniture.jpeg"),
            CategoryPageListItem("furniture 2", "\$20",
                "Description of furniture 2", "assets/furniture.jpeg"),
            CategoryPageListItem("furniture 3", "\$30",
                "Description of furniture 3", "assets/furniture.jpeg"),
            CategoryPageListItem("furniture 4", "\$40",
                "Description of furniture 4", "assets/furniture.jpeg"),
            CategoryPageListItem("furniture 5", "\$50",
                "Description of furniture 5", "assets/furniture.jpeg"),
            Text(
              "Electronics:",
              style: TextStyle(fontSize: 25),
            ),
            CategoryPageListItem("electronic 1", "\$10",
                "Description of electronic 1", "assets/electronic.jpeg"),
            CategoryPageListItem("electronic 2", "\$20",
                "Description of electronic 2", "assets/electronic.jpeg"),
            CategoryPageListItem("electronic 3", "\$30",
                "Description of electronic 3", "assets/electronic.jpeg"),
            CategoryPageListItem("electronic 4", "\$40",
                "Description of electronic 4", "assets/electronic.jpeg"),
            CategoryPageListItem("electronic 5", "\$50",
                "Description of electronic 5", "assets/electronic.jpeg"),
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 160, crossAxisSpacing: 10),
        ),
      ),
    );
  }
}
