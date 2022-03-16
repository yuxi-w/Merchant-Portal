import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/question_dialog/question_dialog.dart';

class RemoveItemListItems extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const RemoveItemListItems({Key? key, required this.shoppingItem})
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
        // image: Image.network(
        //   widget.shoppingItem.picture!,
        //   height: 150,
        //   width: 150,
        //   fit: BoxFit.cover,
        //   key: Key("homeItemImage"),
        // ),
        // showImage: true,

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
          ],
        ),
      ),
    );
  }

  void askQuestionDialog(BuildContext context) {
    ///Show Confirm Dialog
    showDialog(
        context: context,
        builder: (BuildContext context) => QuestionDialog(
                widget.shoppingItem.name!, context, widget.shoppingItem.id!)
            .createDialog());
  }
}
