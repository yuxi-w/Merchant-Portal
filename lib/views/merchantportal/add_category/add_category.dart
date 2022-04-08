import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../../locator.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  late TextEditingController nameText, categoryText, priceText, descriptionText;
  GlobalKey<FormState>? addCategoryFormKey;

  @override
  void initState() {
    super.initState();
    nameText = TextEditingController();
    categoryText = TextEditingController();
    priceText = TextEditingController();
    descriptionText = TextEditingController();
    addCategoryFormKey = GlobalKey<FormState>();
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
                  /// Add Category Main Text
                  const Text(
                    'Add Category',
                    key: Key("add_category_merchant"),
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
                        key: addCategoryFormKey,
                        child: Column(children: [
                          /// Item Category Text Field
                          TextFormField(
                            controller: categoryText,
                            decoration: const InputDecoration(
                              label: Text("Category Name"),
                            ),
                            validator: EmptyFieldValidator.validate,
                          ),

                          /// Item Name Text Field
                          TextFormField(
                            controller: nameText,
                            decoration: const InputDecoration(
                              label: Text("First Item Name"),
                            ),
                            validator: EmptyFieldValidator.validate,
                          ),

                          /// Item Price Text Field
                          TextFormField(
                            controller: priceText,
                            decoration: const InputDecoration(
                              label: Text("\$ First Item Price"),
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
                              hintText: 'First Item Description',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                            ),
                            validator: LengthValidator.validate,
                          ),

                          const SizedBox(height: 50),

                          /// Add Category Button
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key: const Key("add_category_button_merchant"),
                              onPressed: () {
                                if (addCategoryFormKey!.currentState!
                                    .validate()) {
                                  /// CHECK CATEGORY
                                  getShoppingItems(
                                          categoryText.text.toLowerCase())
                                      .then((value) {
                                    print("isExistValue $value");
                                    if (value) {
                                      showErrorDialog();
                                    } else {
                                      addCategory();
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                "Add Category",
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
                          ),
                          const SizedBox(height: 50),
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

  /// API Call to get items and categories
  Future<bool> getShoppingItems(String categoryName) async {
    bool isExistCategory = false;

    try {
      final response = await get(Uri.parse('${baseUrl}shopitem'));
      if (response.statusCode == 200) {
        print("Got shopItems Successfully");

        /// Getting All shopping items
        var shoppingItems =
            ShoppingItem.fromListJson(jsonDecode(response.body));
        print("shoppingItems ${shoppingItems.toString()}");
        if (shoppingItems.isNotEmpty) {
          print("EnteredCategory: $categoryName");

          ///Check Category is available or not
          shoppingItems.forEach((element) {
            if (element.category!.toLowerCase() == categoryName.toLowerCase()) {
              ///Category Exist on Server
              isExistCategory = true;
              return;
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  DialogMessage(context, "No Item Available", "")
                      .createDialog());
        }
      } else {
        print(response.statusCode.toString());
        print("getting shopping items unsuccessful");
      }
    } catch (e) {
      print(e.toString());
    }
    return isExistCategory;
  }

  void addCategory() async {
    try {
      Response response = await post(
          Uri.parse('${baseUrl}shopitem/createbykeys')
              .replace(queryParameters: {
        'name': nameText.text,
        'shortDescription': descriptionText.text,
        'description': descriptionText.text,
        'picture': "coming_soon.jpeg",
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
        print("fail to add category");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void showSuccessDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            DialogMessage(context, "Category Added Successfully", "")
                .createDialog());
  }

  void showErrorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => DialogMessage(
                context,
                categoryText.text,
                "This category already exists on server, please try another name")
            .createDialog());
  }
}
