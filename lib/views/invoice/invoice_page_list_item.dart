import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';

class InvoiceListItem extends StatefulWidget {
  final ShoppingItem shoppingItem;
  final int itemNumber;

  const InvoiceListItem(
      {Key? key, required this.shoppingItem, required this.itemNumber})
      : super(key: key);

  @override
  State<InvoiceListItem> createState() => _InvoiceListItemState();
}

class _InvoiceListItemState extends State<InvoiceListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(92, 16, 32, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.itemNumber.toString() + "- " + widget.shoppingItem.name!,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "\$${widget.shoppingItem.price}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
