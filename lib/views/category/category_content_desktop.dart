import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/category_page_list_view/category_page_list_item.dart';

/// Category Items for desktop screens
class CategoryContentDesktop extends StatefulWidget {
  final List<ShoppingItem> shoppingItemList;
  final List<String> categoryNameList;

  const CategoryContentDesktop(
      {Key? key,
      required this.shoppingItemList,
      required this.categoryNameList})
      : super(key: key);

  @override
  _CategoryContentDesktopState createState() => _CategoryContentDesktopState();
}

class _CategoryContentDesktopState extends State<CategoryContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: buildListView(),
    );
  }

  ListView? buildListView() {
    return ListView.builder(
        itemCount: widget.categoryNameList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(widget.categoryNameList[index].toUpperCase(),
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w800)),
              ),
              itemsGridView(widget.categoryNameList[index])
            ],
          );
        });
  }

  GridView itemsGridView(String categoryName) {
    List<ShoppingItem> categoryItems = [];
    widget.shoppingItemList.forEach((shoppingItem) {
      if (shoppingItem.category?.toLowerCase() == categoryName.toLowerCase()) {
        categoryItems.add(shoppingItem);
      }
    });
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: categoryItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryPageListItem((categoryItems)[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
    );
  }
}
