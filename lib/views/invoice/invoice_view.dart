import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/views/invoice/invoice_content_desktop.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class InvoiceView extends StatefulWidget {
  final List<ShoppingItem> userShoppingBag;

  const InvoiceView({Key? key, required this.userShoppingBag})
      : super(key: key);

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          /// Top Navigation Bar
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Invoice"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Invoice",
            textAlign: TextAlign.right,
            key: Key("invoiceMainTitle"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),

        //Success message
        const SizedBox(height: 12),
        const Center(
          child: Text(
            "Order Placed Successfully!",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            key: Key("invoice_page_order_placed"),
          ),
        ),
        const SizedBox(height: 12),

        /// Divider!
        const SizedBox(
          width: 1350.0,
          height: 20.0,
          child: Divider(
            color: Color.fromARGB(255, 90, 38, 31),
          ),
        ),

        /// Main Content is a List which shows the products in Home Page
        Container(
            constraints: const BoxConstraints(minHeight: 500),
            child: InvoiceContent(userShoppingBag: widget.userShoppingBag)),

        /// Page Footer
        const HomePageFooter()
      ],
    );
  }
}
