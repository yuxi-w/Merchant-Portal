import 'package:flutter/material.dart';
import 'package:merchant_app/views/login/login_content.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),
        const LoginContent(),
        const HomePageFooter()
      ],
    );
  }

  //Widget may be used in future
  // Widget buildDiscussion(String title, String asd) => Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: Card(
  //         clipBehavior: Clip.antiAlias,
  //         child: ExpandablePanel(
  //           header: Text(
  //             title,
  //             style: const TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           collapsed: Text(
  //             asd,
  //             style: const TextStyle(
  //               fontSize: 18,
  //             ),
  //             softWrap: true,
  //             maxLines: 3,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //           expanded: Text(
  //             asd,
  //             style: const TextStyle(
  //               fontSize: 18,
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
}
