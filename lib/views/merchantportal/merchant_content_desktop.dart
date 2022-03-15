import 'package:flutter/material.dart';
import 'package:merchant_app/views/merchantportal/merchant_item.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_item.dart';

class MerchantContentDesktop extends StatefulWidget {
  const MerchantContentDesktop({Key? key}) : super(key: key);

  @override
  State<MerchantContentDesktop> createState() => _MerchantContentDesktopState();
}

class _MerchantContentDesktopState extends State<MerchantContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          MerchantItem(title: "Add Item", imageSrc: "assets/electronics.png"),
          MerchantItem(title: "Edit Item", imageSrc: "assets/electronics.png"),
          MerchantItem(
              title: "Remove Item", imageSrc: "assets/electronics.png"),
          MerchantItem(
              title: "Add Category", imageSrc: "assets/electronics.png"),
          MerchantItem(
              title: "Edit Category", imageSrc: "assets/electronics.png"),
          MerchantItem(
              title: "Remove Category", imageSrc: "assets/electronics.png"),
          MerchantItem(
              title: "Customer's Orders", imageSrc: "assets/electronics.png"),
        ],
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
      ),
    );
  }
}
