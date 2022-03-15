import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MerchantItem extends StatefulWidget {
  final String title;
  final String imageSrc;

  const MerchantItem({Key? key, required this.title, required this.imageSrc})
      : super(key: key);

  @override
  State<MerchantItem> createState() => _MerchantItemState();
}

class _MerchantItemState extends State<MerchantItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: GFCard(
        elevation: 4,
        boxFit: BoxFit.fill,
        titlePosition: GFPosition.start,

        /// Image
        image: Image.asset(
          widget.imageSrc,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
          key: const Key("merchantPictureItem"),
        ),
        showImage: true,

        /// Title
        title: GFListTile(
          titleText: widget.title,
          key: const Key("merchantTitle"),
        ),

        /// Buttons
        buttonBar: GFButtonBar(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  goToDesiredPage();
                },
                child: const Text(
                  "Select >",
                  key: Key("selectButtonMerchant"),
                ))
          ],
        ),
      ),
    );
  }

  void goToDesiredPage() {}
}
