import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';

class InvoiceListItem extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const InvoiceListItem({Key? key, required this.shoppingItem})
      : super(key: key);

  @override
  State<InvoiceListItem> createState() => _InvoiceListItemState();
}

class _InvoiceListItemState extends State<InvoiceListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.shoppingItem.name!),
          Text("\$${widget.shoppingItem.price}")
        ],
      ),
    );
  }
}
