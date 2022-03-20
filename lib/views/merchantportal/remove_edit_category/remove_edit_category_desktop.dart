import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_edit_category/remove_edit_category_item.dart';

class RemoveEditCategoryDesktop extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const RemoveEditCategoryDesktop({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  State<RemoveEditCategoryDesktop> createState() =>
      _RemoveEditCategoryDesktopState();
}

class _RemoveEditCategoryDesktopState extends State<RemoveEditCategoryDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: buildFutureBuilder(),
    );
  }

  FutureBuilder<List<ShoppingItem>> buildFutureBuilder() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator()));
        }

        ///Getting Categories
        Set<String> categoryNameList = {};
        var allItems = snapshot.data as List<ShoppingItem>;
        if (allItems.isNotEmpty) {
          allItems.forEach((shoppingItem) {
            categoryNameList.add(shoppingItem.category!);
          });
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: categoryNameList.length,
          itemBuilder: (BuildContext context, int index) {
            return RemoveEditCategoryItem(
              categoryName: categoryNameList.toList()[index],
              imgWidth: 125,
              imgHeight: 125,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
        );
      },
      future: widget.futureShoppingItems,
    );
  }
}
