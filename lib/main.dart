import 'package:flutter/material.dart';
import 'package:merchant_app/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Merchant App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Builder(
          builder: (BuildContext context) {
            return HomeView(context);
          },
        ));
  }
}
