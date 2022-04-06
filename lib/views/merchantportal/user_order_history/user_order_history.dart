import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/views/merchantportal/user_order_history/user_order_history_list.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class UserOrderHistoryView extends StatefulWidget {
  const UserOrderHistoryView({Key? key}) : super(key: key);

  @override
  State<UserOrderHistoryView> createState() => _UserOrderHistoryViewState();
}

class _UserOrderHistoryViewState extends State<UserOrderHistoryView> {
  late Future<List<UserInfo>> futureUserInfo;
  late UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Order History"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Order History",
            textAlign: TextAlign.right,
            key: Key("orderHistoryTitle"),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),

        /// Main List View
        Container(
            constraints: const BoxConstraints(
                minHeight: 300, minWidth: 300, maxWidth: 1000),
            child: FutureBuilder(
              future: futureUserInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("dataSnapShot ${snapshot.data}");
                  return UserOrderHistoryListView(
                      futureUserInfo: futureUserInfo);
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('Failed to load Order History'));
                } else {
                  return const SizedBox(
                      height: 500,
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            )),
        const SizedBox(height: 200),

        /// Home Page Footer
        const HomePageFooter(),
      ],
    );
  }

  Future<List<UserInfo>> getUserInfo() async {
    final response = await get(Uri.parse('${baseUrl}shopuser/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("getting user successful");
      return UserInfo.fromListJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user info');
    }
  }

  @override
  void initState() {
    super.initState();
    futureUserInfo = getUserInfo();
  }
}
