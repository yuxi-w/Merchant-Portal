import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class EditItemView extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const EditItemView({Key? key, required this.shoppingItem}) : super(key: key);

  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  late TextEditingController nameText, categoryText, priceText, descriptionText;
  GlobalKey<FormState>? addItemFormKey;

  @override
  void initState() {
    super.initState();
    nameText = TextEditingController();
    categoryText = TextEditingController();
    priceText = TextEditingController();
    descriptionText = TextEditingController();
    addItemFormKey = GlobalKey<FormState>();
  }

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
              constraints: const BoxConstraints(minWidth: 900, maxWidth: 1300),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  /// Edit Item Text
                  Text(
                    'Edit Item',
                    key: const Key("edit_item_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade700),
                  ),

                  /// Item Name
                  Text(
                    widget.shoppingItem.name!,
                    key: const Key("item_name_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: infoPageTextColor),
                  ),

                  /// Divider!
                  const SizedBox(
                    width: 1350.0,
                    height: 20.0,
                    child: Divider(
                      color: Color.fromARGB(255, 90, 38, 31),
                    ),
                  ),

                  /// Wrapper to keep everything in center and look nice!
                  Container(
                      constraints:
                          const BoxConstraints(minWidth: 500, maxWidth: 800),
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        /// Item Name Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Item Name"),
                          ),
                          validator: EmptyFieldValidator.validate,
                        ),

                        /// Item Price Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("\$ Item Price"),
                          ),
                          validator: EmptyFieldValidator.validate,
                        ),

                        /// Item Category Text Field
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Item Category"),
                          ),
                          validator: EmptyFieldValidator.validate,
                        ),

                        const SizedBox(height: 50),

                        /// Description Text Field
                        TextFormField(
                          // controller: bodyText,
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          validator: EmptyFieldValidator.validate,
                        ),

                        const SizedBox(height: 50),

                        /// Edit Item Button
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                          child: MaterialButton(
                            key: const Key("edit_item_button_merchant"),
                            onPressed: () {
                              if (addItemFormKey!.currentState!.validate()) {
                                /// Call Edit Item API
                                // editItemApiCall();




                              }
                            },
                            child: const Text(
                              "Edit Item",
                              style: TextStyle(fontSize: 18),
                            ),
                            minWidth: double.infinity,
                            height: 52,
                            elevation: 24,
                            color: Colors.amber.shade700,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
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

  // void editItemApiCall() async {
  //   try {
  //     Response response = await post(
  //         Uri.parse('${baseUrl}shopitem/createbykeys')
  //             .replace(queryParameters: {
  //           'name': nameText.text,
  //           'shortDescription': "short description",
  //           'description': descriptionText.text,
  //           'picture': "a",
  //           'price': priceText.text,
  //           'option': "Black",
  //           'category': categoryText.text,
  //           'quantity': "1",
  //         }));
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       var data = (response.body.toString());
  //       print(data);
  //       print("success");
  //       showSuccessDialog();
  //
  //       /// Go Back to Previous Page
  //       locator<NavigationService>().goBack();
  //     } else {
  //       print("fail");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //
  // }
}
