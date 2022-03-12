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
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 5, 32, 0),
      child: Column(
        children: [
          /// Shopping Items List
          buildListView(),

          /// Divider
          const SizedBox(
            width: 1350.0,
            height: 20.0,
            child: Divider(
              color: Color.fromARGB(255, 90, 38, 31),
            ),
          ),

          /// Subtotal
          Text(
            "Subtotal: \$${calculateSubtotal()}",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  /// Calculate Total Price
  String calculateSubtotal() {
    List<String> priceList = [];
    int totalPrice = 0;
    widget.userShoppingBag.forEach((element) {
      priceList.add(element.price!);
    });
    priceList.forEach((element) {
      totalPrice += int.parse(element);
    });
    return totalPrice.toString();
  }

  /// Create List View
  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.userShoppingBag.length,
      itemBuilder: (BuildContext context, int index) {
        return InvoiceListItem(
            shoppingItem: widget.userShoppingBag[index], itemNumber: index + 1);
      },
    );
  }
}
