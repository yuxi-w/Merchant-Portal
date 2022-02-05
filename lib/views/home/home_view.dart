import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/centered_view/centered_view.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView(BuildContext appContext, {Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

// This is our Home Page
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // Main Page
        body: Container(
          // Main Column
          child: Column(
            children: [
              // Contain Navigation Bar and List View
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Navigation Bar
                    MyNavigationBar(),
                    // Main List View
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text("Hello List View"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              // Bottom Navigation Bar
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [Text("Bottom Nav Bar")],
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
