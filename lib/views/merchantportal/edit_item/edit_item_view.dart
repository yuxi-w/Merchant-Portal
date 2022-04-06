import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../../locator.dart';

/// EDIT ITEM PAGE
class EditItemView extends StatefulWidget {
  final ShoppingItem shoppingItem;

  const EditItemView({Key? key, required this.shoppingItem}) : super(key: key);

  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  late TextEditingController nameText, categoryText, priceText, descriptionText;
  GlobalKey<FormState>? editItemFormKey;

  @override
  void initState() {
    super.initState();
    nameText = TextEditingController();
    categoryText = TextEditingController();
    priceText = TextEditingController();
    descriptionText = TextEditingController();
    editItemFormKey = GlobalKey<FormState>();

    nameText.text = widget.shoppingItem.name!;
    categoryText.text = widget.shoppingItem.category!;
    priceText.text = widget.shoppingItem.price!;
    descriptionText.text = widget.shoppingItem.description!;
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
                      child: Form(
                        key: editItemFormKey,
                        child: Column(children: [
                          /// Item Name Text Field
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Item Name"),
                            ),
                            validator: EmptyFieldValidator.validate,
                            controller: nameText,
                          ),

                          /// Item Price Text Field
                          TextFormField(
                            controller: priceText,
                            decoration: const InputDecoration(
                              label: Text("\$ Item Price"),
                            ),
                            validator: EmptyFieldValidator.validate,
                          ),

                          /// Item Category Text Field
                          TextFormField(
                            controller: categoryText,
                            decoration: const InputDecoration(
                              label: Text("Item Category"),
                            ),
                            validator: EmptyFieldValidator.validate,
                          ),

                          const SizedBox(height: 50),

                          /// Description Text Field
                          TextFormField(
                            controller: descriptionText,
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
                                if (editItemFormKey!.currentState!.validate()) {
                                  /// Call Edit Item API
                                  editItemApiCall();
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
                          ),
                          const SizedBox(height: 20),

                          /// Cancel Button
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key:
                                  const Key("cancel_edit_item_button_merchant"),
                              onPressed: () {
                                /// GO BACK TO PREVIOUS PAGE
                                locator<NavigationService>().goBack();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 18),
                              ),
                              minWidth: double.infinity,
                              height: 52,
                              elevation: 24,
                              color: Colors.red,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                        ]),
                      ))
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

  void editItemApiCall() async {
    try {
      /// Creating JSON Body
      Map myBody = {};
      myBody['name'] = nameText.text;
      myBody['shortDescription'] = descriptionText.text;
      myBody['description'] = descriptionText.text;
      myBody['picture'] = "assets/coming_soon.jpeg";
      myBody['price'] = priceText.text;
      myBody['option'] = "black";
      myBody['category'] = categoryText.text;
      myBody['quantity'] = "1";
      String str = jsonEncode(myBody);
      print(str);
      Response response = await put(
        Uri.parse('${baseUrl}shopitem/${widget.shoppingItem.id}'),
        body: str,
        headers: {"Content-Type": "application/json"},
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        print(data);
        print("Edit Successful");
        showSuccessDialog();

        /// Go Back to Previous Page
        locator<NavigationService>().navigateTo(RemoveItemRoute, null);
      } else {
        print("Edit failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void showSuccessDialog() {
    ///Show Confirm Dialog
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            DialogMessage(context, "Item Edited Successfully", "")
                .createDialog());
  }
}
