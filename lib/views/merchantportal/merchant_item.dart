import 'dart:html';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

import '../../locator.dart';

class MerchantItem extends StatefulWidget {
  final String title;
  final String imageSrc;
  final double imgHeight;
  final double imgWidth;

  const MerchantItem(
      {Key? key,
      required this.title,
      required this.imageSrc,
      required this.imgHeight,
      required this.imgWidth})
      : super(key: key);

  @override
  State<MerchantItem> createState() => _MerchantItemState();
}

class _MerchantItemState extends State<MerchantItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(35, 32, 32, 1),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: GFCard(
            elevation: 4,
            boxFit: BoxFit.fill,
            titlePosition: GFPosition.start,

            /// Image
            image: Image.asset(
              widget.imageSrc,
              height: widget.imgHeight,
              width: widget.imgWidth,
              fit: BoxFit.cover,
              key: const Key("merchantPictureItem"),
            ),
            showImage: true,

            /// Title
            title: GFListTile(
              titleText: widget.title,
              subTitleText: "",
              key: const Key("merchantTitle"),
            ),

            /// Description
            content: const Text(
              "",
            ),

            /// Buttons
            buttonBar: GFButtonBar(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      goToDesiredPage();
                    },
                    child: const Text(
                      "Select >",
                      key: Key("selectButtonMerchant"),
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  void goToDesiredPage() {
    switch (widget.title) {
      case "Add Item":
        locator<NavigationService>().navigateTo(AddItemRoute, null);
        break;

      case "Edit & Remove Item":
        locator<NavigationService>().navigateTo(RemoveItemRoute, null);
    }
  }
}
