import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';

import '../../locator.dart';

/// Shopping cart item
class OrderHistoryListItem extends StatefulWidget {
  final ShoppingItem userShoppingItem;

  const OrderHistoryListItem(this.userShoppingItem);

  @override
  _OrderHistoryListItemState createState() => _OrderHistoryListItemState();
}

class _OrderHistoryListItemState extends State<OrderHistoryListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: GFCard(
        elevation: 2,
        boxFit: BoxFit.fill,
        titlePosition: GFPosition.start,

        ///Title and price
        title: GFListTile(
          titleText: widget.userShoppingItem.name,
          subTitleText: "\$${widget.userShoppingItem.price}",
          key: const Key("orderHistoryItemTitle"),
        ),
        content: Column(
          children: <Widget>[
            /// Item Description
            Text(
              widget.userShoppingItem.description!.substring(0, 70) + "...",
              key: const Key("orderHistoryItemDescription"),
            ),
          ],
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  goToProductDetailPage();
                },
                child: const Text(
                  "More Info >",
                  key: Key("OrderHistoryMoreInfoButton"),
                )),
          ],
        ),
      ),
    );
  }

  void goToProductDetailPage() {
    locator<NavigationService>()
        .navigateTo(ProductDetailRoute, widget.userShoppingItem);
  }
}
