import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_edit_category/remove_edit_category_item.dart';

class RemoveEditCategoryDesktop extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const RemoveEditCategoryDesktop({Key? key, required this.futureShoppingItems}) : super(key: key);

  @override
  State<RemoveEditCategoryDesktop> createState() => _RemoveEditCategoryDesktopState();
}

class _RemoveEditCategoryDesktopState extends State<RemoveEditCategoryDesktop> {
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
        return GridView.builder(
          shrinkWrap: true,
          itemCount: (snapshot.data as List<ShoppingItem>).length,
          itemBuilder: (BuildContext context, int index) {
            return RemoveEditCategoryItem(
                shoppingItem: (snapshot.data as List<ShoppingItem>)[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
        );
      },
      future: widget.futureShoppingItems,
    );
  }

}
