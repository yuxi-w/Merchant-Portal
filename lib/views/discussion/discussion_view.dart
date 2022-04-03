import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/message_list/MessageList.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/dialog_message/dialog_message.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/constants/constants/globals.dart' as globals;

import '../../constants/methods/validation_methods.dart';
import '../../locator.dart';

class DiscussionView extends StatefulWidget {
  const DiscussionView({Key? key}) : super(key: key);

  @override
  State<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends State<DiscussionView> {
  late Future<List<MessageList>?> futureMessageList;
  late TextEditingController titleText, bodyText;
  final postdiscussionformkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    futureMessageList = getMessageList();
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
            key: Key("chat_page_main_title"),
          ),
        ),

        Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 840,
                width: 840,
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
                                    "Conversations",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),

                                  const SizedBox(height: 24),

                                  /// Conversations box area
                                  Container(
                                    height: 350,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(16),
                                      child: FutureBuilder(
                                          future: futureMessageList,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              /// Getting All Messages
                                              var allMessages = snapshot.data
                                                  as List<MessageList>;
                                              print(
                                                  "MessageList ${allMessages.toString()}");

                                              /// Showing Messages in message area
                                              return ListView.builder(
                                                  itemCount: allMessages.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 3.5, 0, 3.5),
                                                      child: Text(
                                                        '${(allMessages)[index].name}: '
                                                        '${(allMessages)[index].content}',
                                                        style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            } else if (snapshot.hasError) {
                                              return const Center(
                                                  child: Text(
                                                      'Failed To Load Data'));
                                            } else {
                                              return const SizedBox(
                                                  height: 500,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator()));
                                            }
                                          }),
                                    ),
                                  ),

                                  const SizedBox(height: 24),

                                  /// Message Text Field
                                  TextFormField(
                                    controller: bodyText,
                                    minLines: 2,
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: 'Type your message',
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
                                      /// Send Message to server
                                      if (postdiscussionformkey.currentState!
                                          .validate()) {
                                        postChatMessage(
                                            globals.name, bodyText.text);
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
                                    key: const Key("chat_page_send_button"),
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

        /// Footer Page
        const HomePageFooter()
      ],
    );
  }

  /// Send Chat API
  void postChatMessage(String userName, String body) async {
    try {
      Response response =
          await post(Uri.parse('${baseUrl}Chat').replace(queryParameters: {
        'Name': userName,
        'Content': body,
      }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        print(data);
        print("success");

        /// Refresh the page
        locator<NavigationService>().navigateTo(DiscussionRoute, null);
      } else {
        print("fail");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /// Get Message List
  Future<List<MessageList>?> getMessageList() async {
    try {
      Response messageListResponse = await get(Uri.parse('${baseUrl}Chat'));
      print(messageListResponse.statusCode);
      if (messageListResponse.statusCode == 200) {
        return MessageList.fromListJson(jsonDecode(messageListResponse.body));
      } else {
        print("getting message list failed");
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
