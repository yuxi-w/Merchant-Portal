import 'package:flutter/material.dart';
import 'package:merchant_app/views/category/category_content_desktop.dart';
import 'package:merchant_app/views/category/category_content_mobile.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// This is our Category Page
class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// The Text Showing "Category page"
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(70, 20, 10, 10),
          child: const Text(
            "Category",
            textAlign: TextAlign.right,
            key: Key("categoryMainTitle"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),

        /// Main Content and products on category page
        ScreenTypeLayout(
          mobile: const CategoryContentMobile(),
          desktop: const CategoryContentDesktop(),
        ),

        /// Page Footer
        const HomePageFooter()
      ],
    );
  }
}
