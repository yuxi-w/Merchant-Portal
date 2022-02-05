import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/centered_view/centered_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView(BuildContext appContext, {Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CenteredView(Column(
          children: [MyNavigationBar()],
        )));
  }
}
