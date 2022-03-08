import 'package:flutter/material.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

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
                      children: const [
                        /// top Picture1 section!
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('./assets/electronics.png'),
                        ),

                        /// top Picture1 section!
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('./assets/electronics.png'),
                        ),

                        /// top Picture1 section!
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('./assets/electronics.png'),
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
                    'Product 1',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: infoPageTextColor),
                    key: const Key("productDetailTitle"),
                  ),

                  /// Product Category section!
                  Text(
                    'Product Category',
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
                              children: const [
                                /// Product information
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
                                  "rutrum at ex non eleifend. Aenean sed eros a purus "
                                  "gravida scelerisque id in orci. Mauris elementum id "
                                  "nibh et dapibus. Maecenas lacinia volutpat magna"
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
                                  "rutrum at ex non eleifend. Aenean sed eros a purus "
                                  "gravida scelerisque id in orci. Mauris elementum id "
                                  "nibh et dapibus. Maecenas lacinia volutpat magna",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      height: 1.5),
                                  key: Key("productDetailDescription"),
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
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      r"$95",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                      key: Key("productDetailPrice"),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  /// Product color section
                                  Text(
                                    'Product color:',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: infoPageTextColor),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),

                                    /// Product color status section
                                    child: Text("Black",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                        key: Key("productDetailColor")),
                                  )
                                ],
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                              constraints: const BoxConstraints(
                                  minWidth: 400, maxWidth: 700),
                              child: Row(
                                children: [
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: infoPageTextColor),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                    key: Key("productDetailQuantityText"),
                                  ),
                                  const SizedBox(width: 25),
                                  Card(
                                    child: IconButton(
                                      iconSize: 25,
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                      key: const Key("productDetailAddButton"),
                                    ),
                                  ),
                                  Card(
                                    child: IconButton(
                                      iconSize: 25,
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                      key: const Key(
                                          "productDetailRemoveButton"),
                                    ),
                                  ),
                                ],
                              )),
                        ),

                        /// Button to add item to the shopping list!
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              "Add to Bag +",
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

        /// Footer
        const HomePageFooter()
      ],
    );
  }
}
