import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/question_dialog/category_question_dialog.dart';

class RemoveEditCategoryItem extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const RemoveEditCategoryItem({Key? key, required this.shoppingItem})
      : super(key: key);

  @override
  State<RemoveEditCategoryItem> createState() => _RemoveEditCategoryItemState();
}

class _RemoveEditCategoryItemState extends State<RemoveEditCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: GFCard(
        elevation: 4,
        boxFit: BoxFit.fill,
        titlePosition: GFPosition.start,

        /// Title
        title: GFListTile(
          titleText: "Category name",
          subTitleText: widget.shoppingItem.category,
          key: const Key("remove_item_title"),
        ),

        /// Description
        content: const Text(
          "",
          key: Key("remove_item_description"),
        ),

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            /// Remove Button
            MaterialButton(
              onPressed: () {
                askQuestionDialog(context);
              },
              child: const Text("Remove Category"),
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
              },
              child: const Text("Edit Category"),
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

  /// ASK ARE YOU SURE TO REMOVE THE CATEGORY?
  void askQuestionDialog(BuildContext context) {
    ///Show Confirm Dialog
    showDialog(
        context: context,
        builder: (BuildContext context) => CategoryQuestionDialog(
            widget.shoppingItem.name!, context, widget.shoppingItem.id!)
            .createDialog());
  }
}
