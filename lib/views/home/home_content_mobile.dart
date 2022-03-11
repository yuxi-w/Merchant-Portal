import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

/// Home Page Layout for mobile screens or when the screen shrinks
class HomeContentMobile extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const HomeContentMobile({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  _HomeContentMobileState createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
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
            return HomePageListItem(
                (snapshot.data as List<ShoppingItem>)[index]);
          },
        );
      },
      future: widget.futureShoppingItems,
    );
  }
}
