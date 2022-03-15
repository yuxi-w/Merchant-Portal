import 'package:flutter/material.dart';
import 'package:merchant_app/views/merchantportal/merchant_item.dart';

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
          MerchantItem(
              title: "Add Item",
              imageSrc: "assets/add_item.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Edit Item",
              imageSrc: "assets/edit_item.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Remove Item",
              imageSrc: "assets/remove_item.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Add Category",
              imageSrc: "assets/add_category.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Edit Category",
              imageSrc: "assets/edit_item.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Remove Category",
              imageSrc: "assets/remove_category.png",
              imgHeight: 150,
              imgWidth: 150),
          MerchantItem(
              title: "Customer's Orders",
              imageSrc: "assets/user_orders.png",
              imgHeight: 150,
              imgWidth: 150),
        ],
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      ),
    );
  }
}
