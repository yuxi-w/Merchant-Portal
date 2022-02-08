import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({BuildContext? appContext, Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

/// This is our Home Page
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const HomePageListView();
  }
}
