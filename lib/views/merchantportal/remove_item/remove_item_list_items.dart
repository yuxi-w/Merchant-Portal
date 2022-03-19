import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/question_dialog/question_dialog.dart';

import '../../../locator.dart';

/// REMOVE ITEM PAGE
class RemoveItemListItems extends StatefulWidget {
  final ShoppingItem shoppingItem;
  final double height;
  final double width;

  const RemoveItemListItems(
      {Key? key,
      required this.shoppingItem,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<RemoveItemListItems> createState() => _RemoveItemListItemsState();
}

class _RemoveItemListItemsState extends State<RemoveItemListItems> {
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
          "assets/item_edit.png",
          height: widget.height,
          width: widget.width,
          fit: BoxFit.cover,
          key: const Key("remove_item_img"),
        ),
        showImage: true,

        /// Title
        title: GFListTile(
          titleText: widget.shoppingItem.name,
          subTitleText: "\$${widget.shoppingItem.price}",
          key: const Key("remove_item_title"),
        ),

        /// Description
        content: Text(
          widget.shoppingItem.shortDescription!,
          key: const Key("remove_item_description"),
        ),

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            /// Remove Button
            MaterialButton(
              onPressed: () {
                askQuestionDialog(context);
              },
              child: const Text("Remove Item"),
              minWidth: 152,
              height: 52,
              elevation: 24,
              color: Colors.red,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),

            /// Edit Button
            MaterialButton(
              onPressed: () {
                goToEditItemPage(widget.shoppingItem);
              },
              child: const Text("Edit Item"),
              minWidth: 152,
              height: 52,
              elevation: 24,
              color: Colors.amber.shade700,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),
          ],
        ),
      ),
    );
  }

  /// ASK ARE YOU SURE TO REMOVE THE ITEM?
  void askQuestionDialog(BuildContext context) {
    ///Show Confirm Dialog
    showDialog(
        context: context,
        builder: (BuildContext context) => QuestionDialog(
                widget.shoppingItem.name!, context, widget.shoppingItem.id!)
            .createDialog());
  }

  /// GO TO EDIT ITEM PAGE
  void goToEditItemPage(ShoppingItem shoppingItem) {
    locator<NavigationService>().navigateTo(EditItemRoute, shoppingItem);
  }
}
