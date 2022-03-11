import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/category_page_list_view/category_page_list_item.dart';

/// Category Items for mobile screens
class CategoryContentMobile extends StatefulWidget {
  // final Future<List<ShoppingItem>> futureShoppingItems;

  const CategoryContentMobile({Key? key})
      : super(key: key);

  @override
  _CategoryContentMobileState createState() => _CategoryContentMobileState();
}

class _CategoryContentMobileState extends State<CategoryContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(100, 16, 100, 16),
      child: Flexible(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Books",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            // ListView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   children: const [
            //     CategoryPageListItem("book 1", "\$10", "Description of book 1",
            //         "assets/book.jpeg"),
            //     CategoryPageListItem("book 2", "\$20", "Description of book 2",
            //         "assets/book.jpeg"),
            //     CategoryPageListItem("book 3", "\$30", "Description of book 3",
            //         "assets/book.jpeg"),
            //     CategoryPageListItem("book 4", "\$40", "Description of book 4",
            //         "assets/book.jpeg"),
            //     CategoryPageListItem("book 5", "\$50", "Description of book 5",
            //         "assets/book.jpeg"),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Clothing",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            // ListView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   children: const [
            //     CategoryPageListItem("clothing 1", "\$10",
            //         "Description of clothing 1", "assets/clothes.jpeg"),
            //     CategoryPageListItem("clothing 2", "\$20",
            //         "Description of clothing 2", "assets/clothes.jpeg"),
            //     CategoryPageListItem("clothing 3", "\$30",
            //         "Description of clothing 3", "assets/clothes.jpeg"),
            //     CategoryPageListItem("clothing 4", "\$40",
            //         "Description of clothing 4", "assets/clothes.jpeg"),
            //     CategoryPageListItem("clothing 5", "\$50",
            //         "Description of clothing 5", "assets/clothes.jpeg"),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Furniture",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            // ListView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   children: const [
            //     CategoryPageListItem("furniture 1", "\$10",
            //         "Description of furniture 1", "assets/furniture.jpeg"),
            //     CategoryPageListItem("furniture 2", "\$20",
            //         "Description of furniture 2", "assets/furniture.jpeg"),
            //     CategoryPageListItem("furniture 3", "\$30",
            //         "Description of furniture 3", "assets/furniture.jpeg"),
            //     CategoryPageListItem("furniture 4", "\$40",
            //         "Description of furniture 4", "assets/furniture.jpeg"),
            //     CategoryPageListItem("furniture 5", "\$50",
            //         "Description of furniture 5", "assets/furniture.jpeg"),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Electronics",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            // ListView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   children: const [
            //     CategoryPageListItem("electronic 1", "\$10",
            //         "Description of electronic 1", "assets/electronics.png"),
            //     CategoryPageListItem("electronic 2", "\$20",
            //         "Description of electronic 2", "assets/electronics.png"),
            //     CategoryPageListItem("electronic 3", "\$30",
            //         "Description of electronic 3", "assets/electronics.png"),
            //     CategoryPageListItem("electronic 4", "\$40",
            //         "Description of electronic 4", "assets/electronics.png"),
            //     CategoryPageListItem("electronic 5", "\$50",
            //         "Description of electronic 5", "assets/electronics.png"),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
