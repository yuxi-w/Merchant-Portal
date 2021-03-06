import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

/// This Class holds each item of the CategoryView page
class CategoryPageListItem extends StatefulWidget {
  final ShoppingItem shoppingItem;
  final double imgHeight;
  final double imgWidth;

  const CategoryPageListItem(
    this.shoppingItem, {
    Key? key,
    required this.imgHeight,
    required this.imgWidth,
  }) : super(key: key);

  @override
  _CategoryPageListItemState createState() => _CategoryPageListItemState();
}

class _CategoryPageListItemState extends State<CategoryPageListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: GFCard(
        elevation: 4,
        boxFit: BoxFit.fill,
        titlePosition: GFPosition.start,

        /// Image
        image: Image.asset(
          widget.shoppingItem.picture!,
          height: widget.imgHeight,
          width: widget.imgWidth,
          fit: BoxFit.cover,
        ),
        showImage: true,

        /// Title
        title: GFListTile(
          titleText: widget.shoppingItem.name,
          subTitleText: "\$${widget.shoppingItem.price}",
          key: const Key("categoryItemTitle"),
        ),

        /// Description
        content: Text(
          widget.shoppingItem.description!.substring(0, 70) + "...",
          key: const Key("categoryItemDescription"),
        ),

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  goToProductDetailPage();
                },
                child: const Text(
                  "More Info >",
                  key: Key("CategoryMoreInfoButton"),
                ))
          ],
        ),
      ),
    );
  }

  void goToProductDetailPage() {
    locator<NavigationService>()
        .navigateTo(ProductDetailRoute, widget.shoppingItem);
  }
}
