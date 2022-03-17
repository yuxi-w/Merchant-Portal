import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../../locator.dart';

class AddItemView extends StatefulWidget {
  const AddItemView({Key? key}) : super(key: key);

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
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
                  /// Add Item Main Text
                  const Text(
                    'Add Item',
                    key: Key("add_item_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
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
                        key: addItemFormKey,
                        child: Column(children: [
                          /// Item Name Text Field
                          TextFormField(
                            controller: nameText,
                            decoration: const InputDecoration(
                              label: Text("Item Name"),
                            ),
                            validator: EmptyFieldValidator.validate,
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

                          /// Add Item Button
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key: const Key("add_item_button_merchant"),
                              onPressed: () {
                                if (addItemFormKey!.currentState!.validate()) {
                                  /// Call Add Item API
                                  addItem();
                                }
                              },
                              child: const Text(
                                "Add Item",
                                style: TextStyle(fontSize: 18),
                              ),
                              minWidth: double.infinity,
                              height: 52,
                              elevation: 24,
                              color: Colors.green,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          )
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

  /// Add Item API
  void addItem() async {
    try {
      Response response = await post(
          Uri.parse('${baseUrl}shopitem/createbykeys')
              .replace(queryParameters: {
        'name': nameText.text,
        'shortDescription': descriptionText.text,
        'description': descriptionText.text,
        'picture': "a",
        'price': priceText.text,
        'option': "Black",
        'category': categoryText.text,
        'quantity': "1",
      }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        print(data);
        print("success");
        showSuccessDialog();

        /// Go Back to Previous Page
        locator<NavigationService>().goBack();
      } else {
        print("fail");
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
            DialogMessage(context, "Item Added Successfully", "")
                .createDialog());
  }
}
