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
