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
  late Future<List<ShoppingItem>> futureShoppingItems;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          /// Top Navigation Bar
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Home"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Home",
            textAlign: TextAlign.right,
            key: Key("invoiceMainTitle"),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),

        /// Main Content is a List which shows the products in Home Page
        InvoiceContent(userShoppingBag: widget.userShoppingBag),

        /// Page Footer
        const HomePageFooter()
      ],
    );
  }

// Future<List<ShoppingItem>> getUserInvoice(int userId) async {
//   final response = await get(Uri.parse('${baseUrl}Invoice$userId'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print("Getting user invoice was successful");
//     return ShoppingItem.fromListJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load user invoice');
//   }
// }

// @override
// void initState() {
//   super.initState();
//   futureShoppingItems = getUserInvoice(widget.userId);
// }
}
