import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

import '../../locator.dart';

class ProductDetailView extends StatefulWidget {
  final ShoppingItem? shoppingItem;

  const ProductDetailView({Key? key, required this.shoppingItem})
      : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main content of the page
        Container(
          alignment: Alignment.center,
          child: SafeArea(
            child: Container(
              constraints: const BoxConstraints(minWidth: 700, maxWidth: 900),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// top Picture1 section!
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage(widget.shoppingItem!.picture!),
                        ),
                      ]),

                  /// Divider!
                  const SizedBox(
                    width: 1350.0,
                    height: 20.0,
                    child: Divider(
                      color: Color.fromARGB(255, 90, 38, 31),
                    ),
                  ),

                  ///  Product Name section!
                  Text(
                    widget.shoppingItem!.name!,
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: infoPageTextColor),
                    key: const Key("productDetailTitle"),
                  ),

                  /// Product Category section!
                  Text(
                    widget.shoppingItem!.category!,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: infoPageTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5),
                    key: const Key("productDetailCategory"),
                  ),

                  /// Smaller wrapper to keep everything in center and look nice and professional
                  Container(
                      constraints:
                          const BoxConstraints(minWidth: 500, maxWidth: 800),
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                /// Product information
                                Text(
                                  widget.shoppingItem!.description!,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      height: 1.5),
                                  key: const Key("productDetailDescription"),
                                )
                              ],
                            )),

                        /// Product price text section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product price:',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: infoPageTextColor),
                                  ),

                                  /// Product price section
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "\$${widget.shoppingItem!.price!}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                      key: const Key("productDetailPrice"),
                                    ),
                                  )
                                ],
                              )),
                        ),

                        /// Add to cart button
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 50, 25, 2),
                          child: MaterialButton(
                            onPressed: () {
                              /// Add to Cart API Call
                              if (globals.isLoggedIn && globals.isBuyer) {
                                addToCart(globals.id, widget.shoppingItem!.id!);

                                ///Show Dialog
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogMessage(
                                                context,
                                                widget.shoppingItem!.name!,
                                                "Item added to your cart")
                                            .createDialog());

                                /// Reroute to Previous Page
                                locator<NavigationService>().goBack();
                              } else {
                                if (globals.isLoggedIn == false) {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    title: 'Oops...',
                                    text:
                                        "Please login to add items to your cart!",
                                    loopAnimation: false,
                                  );
                                } else {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    title: 'Oops...',
                                    text:
                                        "You need to login via a Buyer account to access this feature!",
                                    loopAnimation: false,
                                  );
                                }
                              }
                            },

                            ///Add to cart text
                            child: const Text(
                              "Add to Cart +",
                              style: TextStyle(fontSize: 18),
                            ),
                            minWidth: double.infinity,
                            height: 52,
                            elevation: 24,
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            key: const Key("productDetailAddToBagButton"),
                          ),
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 190),

        /// Footer
        const HomePageFooter()
      ],
    );
  }

  /// Adding to cart API
  void addToCart(String userId, itemId) async {
    final response =
        await post(Uri.parse('${baseUrl}shopuser/Add$userId?itemId=$itemId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return print("Post was successfull");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Add to Cart');
    }
  }
}
