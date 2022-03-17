import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_edit_category/remove_edit_category_item.dart';

class RemoveEditCategoryMobile extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const RemoveEditCategoryMobile({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  State<RemoveEditCategoryMobile> createState() =>
      _RemoveEditCategoryMobileState();
}

class _RemoveEditCategoryMobileState extends State<RemoveEditCategoryMobile> {
  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder();
  }

  FutureBuilder<List<ShoppingItem>> buildFutureBuilder() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator()));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: (snapshot.data as List<ShoppingItem>).length,
          itemBuilder: (BuildContext context, int index) {
            return RemoveEditCategoryItem(
              shoppingItem: (snapshot.data as List<ShoppingItem>)[index],
            );
          },
        );
      },
      future: widget.futureShoppingItems,
    );
  }
}
