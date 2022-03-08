// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

/// This Class holds each item of the GridView in Home Page
class HomePageListItem extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final String pictureLink;

  const HomePageListItem(
      this.title, this.price, this.description, this.pictureLink,
      {Key? key})
      : super(key: key);

  @override
  _HomePageListItemState createState() => _HomePageListItemState();
}

class _HomePageListItemState extends State<HomePageListItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GFCard(
          elevation: 4,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,

          /// Image
          image: Image.asset(
            widget.pictureLink,
            height: 180,
            width: 200,
            fit: BoxFit.cover,
            key: Key("homeItemImage"),
          ),
          showImage: true,

          /// Title
          title: GFListTile(
            titleText: widget.title,
            subTitleText: widget.price,
            key: Key("title"),
          ),

          /// Description
          content: Text(
            widget.description,
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
                    "More Info",
                    key: Key("HomeMoreInfoButton"),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  void goToProductDetailPage() {
    locator<NavigationService>().navigateTo(ProductDetailRoute);
  }
}
