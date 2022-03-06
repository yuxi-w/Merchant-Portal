import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import '../../constants/methods/validation_methods.dart';

class DiscussionView extends StatefulWidget {
  const DiscussionView({Key? key}) : super(key: key);

  @override
  State<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends State<DiscussionView> {
  final postdiscussionformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        // The Text Showing "Discussion Page"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Discussion Page",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
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

                                  /// Input text Field
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      label: Text("Title"),
                                      hintText: "Enter Title",
                                    ),
                                    validator: EmptyFieldValidator.validate,
                                  ),

                                  const SizedBox(height: 24),

                                  /// Password Text Field
                                  TextFormField(
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

                                  MaterialButton(
                                    onPressed: () {
                                      if (postdiscussionformkey.currentState!
                                          .validate()) {
                                        //onpress goes in here
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
                                  ),
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

        const HomePageFooter()
      ],
    );
  }
}
