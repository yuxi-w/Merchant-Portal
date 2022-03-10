import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

/// Home Page Layout for desktop screen
class HomeContentDesktop extends StatefulWidget {
  final Future<List<ShoppingItem>> futureShoppingItems;

  const HomeContentDesktop({Key? key, required this.futureShoppingItems})
      : super(key: key);

  @override
  _HomeContentDesktopState createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const SizedBox(
                height: 500, child: Center(child: CircularProgressIndicator()));
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: (snapshot.data as List<ShoppingItem>).length,
            itemBuilder: (BuildContext context, int index) {
              return HomePageListItem(
                  (snapshot.data as List<ShoppingItem>)[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
          );
        },
        future: widget.futureShoppingItems,
      ),
    );
  }
}
