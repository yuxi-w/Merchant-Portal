import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/colors/app_colors.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../../locator.dart';

class EditCategoryView extends StatefulWidget {
  final String categoryName;

  const EditCategoryView({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<EditCategoryView> createState() => _EditCategoryViewState();
}

class _EditCategoryViewState extends State<EditCategoryView> {
  late TextEditingController newCategoryName;
  GlobalKey<FormState>? editCategoryKeyForm;

  @override
  void initState() {
    super.initState();
    newCategoryName = TextEditingController();
    editCategoryKeyForm = GlobalKey<FormState>();
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
                  /// Edit Category Text
                  Text(
                    'Edit Category',
                    key: const Key("edit_category_merchant"),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade700),
                  ),

                  /// Category Name
                  Text(
                    widget.categoryName,
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
                        key: editCategoryKeyForm,
                        child: Column(children: [
                          /// Category Name Text Field
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Enter new name"),
                            ),
                            validator: EmptyFieldValidator.validate,
                            controller: newCategoryName,
                          ),

                          const SizedBox(height: 50),

                          /// Edit Category Button
                          Container(
                            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                            child: MaterialButton(
                              key: const Key("edit_category_button_merchant"),
                              onPressed: () {
                                if (editCategoryKeyForm!.currentState!
                                    .validate()) {
                                  /// Call Edit Category API
                                  editCategoryApiCall();
                                }
                              },
                              child: const Text(
                                "Edit Category",
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
                              key: const Key(
                                  "cancel_edit_category_button_merchant"),
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

  Future<void> editCategoryApiCall() async {
    try {
      final response = await post(Uri.parse('${baseUrl}shopitem/changecategory')
          .replace(queryParameters: {
        'oldcat': widget.categoryName,
        'newcat': newCategoryName.text,
      }));
      if (response.statusCode == 200) {
        print("Category Edited Successfully");
        locator<NavigationService>().navigateTo(RemoveEditCategoryRoute, null);
      } else {
        print("Category Edit failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
