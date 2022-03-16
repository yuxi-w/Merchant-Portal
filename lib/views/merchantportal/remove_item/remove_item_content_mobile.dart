import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/merchantportal/remove_item/remove_item_list_items.dart';

class RemoveItemContentMobile extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const RemoveItemContentMobile({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  State<RemoveItemContentMobile> createState() =>
      _RemoveItemContentDesktopState();
}

class _RemoveItemContentDesktopState extends State<RemoveItemContentMobile> {
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
        return ListView.builder(
          shrinkWrap: true,
          itemCount: (snapshot.data as List<ShoppingItem>).length,
          itemBuilder: (BuildContext context, int index) {
            return RemoveItemListItems(
              shoppingItem: (snapshot.data as List<ShoppingItem>)[index],
            );
          },
        );
      },
      future: widget.futureShoppingItems,
    );
  }
}
