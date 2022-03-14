import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/category_page_list_view/category_page_list_item.dart';

/// Category Items for mobile screens
class CategoryContentMobile extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const CategoryContentMobile({Key? key, required this.futureShoppingItems})
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
              child: Text("electronics",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            buildFutureBuilder("electronics"),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("tv",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            buildFutureBuilder("tv"),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("airpods",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            buildFutureBuilder("airpods"),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("headphones",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            ),
            buildFutureBuilder("headphones"),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ShoppingItem>> buildFutureBuilder(String categoryName) {
    return FutureBuilder(
      future: widget.futureShoppingItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapShotData ${snapshot.data}");
          var allShoppingItems = snapshot.data as List<ShoppingItem>;
          List<ShoppingItem> categoryItems = [];
          allShoppingItems.forEach((element) {
            if (element.category?.toLowerCase() == categoryName.toLowerCase()) {
              categoryItems.add(element);
            }
          });
          if (categoryItems.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categoryItems.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryPageListItem((categoryItems)[index]);
              },
            );
          } else {
            return const SizedBox(
                height: 500,
                child: Center(
                    child: Text(
                  "Items Not Available",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )));
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed To Load Data'));
        } else {
          return const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
