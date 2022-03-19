import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/category_page_list_view/category_page_list_item.dart';

/// Category Items for mobile screens
class CategoryContentMobile extends StatefulWidget {
  final List<ShoppingItem> shoppingItemList;
  final List<String> categoryNameList;

  const CategoryContentMobile(
      {Key? key,
      required this.shoppingItemList,
      required this.categoryNameList})
      : super(key: key);

  @override
  _CategoryContentMobileState createState() => _CategoryContentMobileState();
}

class _CategoryContentMobileState extends State<CategoryContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(100, 16, 100, 16),
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

  ListView itemsGridView(String categoryName) {
    List<ShoppingItem> categoryItems = [];
    widget.shoppingItemList.forEach((shoppingItem) {
      if (shoppingItem.category?.toLowerCase() == categoryName.toLowerCase()) {
        categoryItems.add(shoppingItem);
      }
    });
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: categoryItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryPageListItem((categoryItems)[index]);
      },
    );
  }
}
