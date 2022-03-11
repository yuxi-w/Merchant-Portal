import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/invoice/invoice_page_list_item.dart';

class InvoiceContent extends StatefulWidget {
  final List<ShoppingItem> userShoppingBag;

  const InvoiceContent({Key? key, required this.userShoppingBag})
      : super(key: key);

  @override
  State<InvoiceContent> createState() => _InvoiceContentHomeState();
}

class _InvoiceContentHomeState extends State<InvoiceContent> {
  @override
  Widget build(BuildContext context) {
    return buildListView();
  }


  /// Create List View
  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.userShoppingBag.length,
      itemBuilder: (BuildContext context, int index) {
        return InvoiceListItem(shoppingItem: widget.userShoppingBag[index]);
      },
    );
  }
}
