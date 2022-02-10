import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/layout_holder/layout_holder.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  /// Setup Locator creates a singleton navigation service
  /// in order to navigate between pages
  setupLocator();

  /// Responsive Layout Breakpoints
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 900, tablet: 900, watch: 200),
  );
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
