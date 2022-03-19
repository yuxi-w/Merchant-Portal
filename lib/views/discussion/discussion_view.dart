import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../constants/methods/validation_methods.dart';
import '../../locator.dart';

class DiscussionView extends StatefulWidget {
  const DiscussionView({Key? key}) : super(key: key);

  @override
  State<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends State<DiscussionView> {
  late TextEditingController titleText, bodyText;
  final postdiscussionformkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleText = TextEditingController();
    bodyText = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),

          /// Top Navigation Bar
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Discussion Page"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Discussion Page",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          key: Key("chat_page_main_title"),),
        ),

        Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 640,
                width: 640,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Row(
                  key: const Key('left_right'),
                  children: [
                    Expanded(
                      child: Scaffold(
                        body: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(120.0),
                            child: Form(
                              key: postdiscussionformkey,
                              child: ListView(
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    "New Post",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),

                                  const SizedBox(height: 24),

                                  /// Title Text Field
                                  TextFormField(
                                    controller: titleText,
                                    decoration: const InputDecoration(
                                      label: Text("Title"),
                                      hintText: "Enter Title",
                                    ),
                                    validator: EmptyFieldValidator.validate,
                                  ),

                                  const SizedBox(height: 24),

                                  /// Description Text Field
                                  TextFormField(
                                    controller: bodyText,
                                    minLines: 2,
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: 'description',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                    ),
                                    validator: EmptyFieldValidator.validate,
                                  ),

                                  const SizedBox(height: 24),

                                  /// Post Button
                                  MaterialButton(
                                    onPressed: () {
                                      if (postdiscussionformkey.currentState!
                                          .validate()) {
                                        postChatMessage(
                                            titleText.text, bodyText.text);

                                        ///Show Confirm Dialog
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                DialogMessage(
                                                        context,
                                                        "Your message has been received",
                                                        "Thank you for your message, the merchant will answer as soon as possible...")
                                                    .createDialog());

                                        /// Go Back to Previous Page
                                        locator<NavigationService>().goBack();
                                      }
                                    },
                                    child: const Text("Post"),
                                    minWidth: double.infinity,
                                    height: 52,
                                    elevation: 24,
                                    color: Colors.amber.shade700,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                  key: const Key("chat_page_send_button"),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        /// Footer Page
        const HomePageFooter()
      ],
    );
  }

  /// Send Chat API
  void postChatMessage(String title, String body) async {
    try {
      Response response =
          await post(Uri.parse('${baseUrl}Chat').replace(queryParameters: {
        'Name': title,
        'Content': body,
      }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        print(data);
        print("success");
      } else {
        print("fail");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
