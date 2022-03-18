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
          MerchantItem(
              title: "Add Item",
              imageSrc: "assets/add_item.png",
              imgHeight: 50,
              imgWidth: 50),
          MerchantItem(
              title: "Edit & Remove Item",
              imageSrc: "assets/edit_item.png",
              imgHeight: 50,
              imgWidth: 50),
          MerchantItem(
              title: "Add Category",
              imageSrc: "assets/add_category.png",
              imgHeight: 50,
              imgWidth: 50),
          MerchantItem(
              title: "Edit & Remove Category",
              imageSrc: "assets/category_remove_edit.png",
              imgHeight: 50,
              imgWidth: 50),
          MerchantItem(
              title: "Customer's Orders",
              imageSrc: "assets/user_orders.png",
              imgHeight: 50,
              imgWidth: 50),
        ],
      ),
    );
  }
}
