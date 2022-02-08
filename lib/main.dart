import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/layout_holder/layout_holder.dart';

void main() {
  /// Setup Locator creates a singleton navigation service in order to navigate between pages
  setupLocator();
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
        home: const LayoutHolder());
  }
}
