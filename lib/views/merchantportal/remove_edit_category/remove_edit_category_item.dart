import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/widgets/question_dialog/category_question_dialog.dart';

class RemoveEditCategoryItem extends StatefulWidget {
  final String categoryName;
  final double imgHeight;
  final double imgWidth;

  const RemoveEditCategoryItem(
      {Key? key,
      required this.categoryName,
      required this.imgHeight,
      required this.imgWidth})
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
        title: const GFListTile(
          titleText: "Category name:",
          key: Key("remove_category_title"),
        ),

        /// Description
        content: Text(
          widget.categoryName,
          key: const Key("remove_category_description"),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),

        /// Image
        image: Image.asset(
          "assets/remove_category.png",
          height: widget.imgHeight,
          width: widget.imgWidth,
          fit: BoxFit.cover,
          key: Key("category_remove_pic"),
        ),
        showImage: true,

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            /// Remove Button
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: MaterialButton(
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
            ),

            /// Edit Button
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: MaterialButton(
                onPressed: () {},
                child: const Text("Edit Category"),
                minWidth: 152,
                height: 52,
                elevation: 24,
                color: Colors.amber.shade700,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
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
              widget.categoryName,
              context,
            ).createDialog());
  }
}
