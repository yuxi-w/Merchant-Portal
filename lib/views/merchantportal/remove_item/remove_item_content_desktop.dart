import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item_list_items.dart';

class RemoveItemContentDesktop extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const RemoveItemContentDesktop({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  State<RemoveItemContentDesktop> createState() =>
      _RemoveItemContentDesktopState();
}

class _RemoveItemContentDesktopState extends State<RemoveItemContentDesktop> {
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
        return GridView.builder(
          shrinkWrap: true,
          itemCount: (snapshot.data as List<ShoppingItem>).length,
          itemBuilder: (BuildContext context, int index) {
            return RemoveItemListItems(
              shoppingItem: (snapshot.data as List<ShoppingItem>)[index],
              height: 150,
              width: 150,
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
