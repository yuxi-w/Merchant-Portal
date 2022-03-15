import 'package:flutter/cupertino.dart';
import 'package:merchant_app/views/merchantportal/merchant_item.dart';

class MerchantContentMobile extends StatefulWidget {
  const MerchantContentMobile({Key? key}) : super(key: key);

  @override
  State<MerchantContentMobile> createState() => _MerchantContentMobileState();
}

class _MerchantContentMobileState extends State<MerchantContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
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
      ),
    );
  }
}
