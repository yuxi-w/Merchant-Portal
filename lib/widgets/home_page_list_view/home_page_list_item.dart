// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

/// This Class holds each item of the GridView in Home Page
class HomePageListItem extends StatefulWidget {
  final ShoppingItem shoppingItem;
  final double imgWidth;
  final double imgHeight;

  const HomePageListItem(
    this.shoppingItem, {
    Key? key,
    required this.imgWidth,
    required this.imgHeight,
  }) : super(key: key);

  @override
  _HomePageListItemState createState() => _HomePageListItemState();
}

class _HomePageListItemState extends State<HomePageListItem> {
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
          key: Key("homeItemImage"),
        ),
        showImage: true,

        /// Title
        title: GFListTile(
          titleText: widget.shoppingItem.name,
          subTitleText: "\$${widget.shoppingItem.price}",
          key: Key("title"),
        ),

        /// Description
        content: Text(
          widget.shoppingItem.description!.substring(0, 70) + "...",
          key: Key("description"),
        ),

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  goToProductDetailPage();
                },
                child: Text(
                  "More Info >",
                  key: Key("HomeMoreInfoButton"),
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
