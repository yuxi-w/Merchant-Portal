import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// Shopping cart item
class ShopCartListItem extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final int amount;
  final String imageSrc;

  const ShopCartListItem(
      this.title, this.price, this.description, this.amount, this.imageSrc,
      {Key? key})
      : super(key: key);

  @override
  _ShopCartListItemState createState() => _ShopCartListItemState();
}

class _ShopCartListItemState extends State<ShopCartListItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GFCard(
          elevation: 2,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,
          image: Image.asset(
            widget.imageSrc,
            height: 180,
            width: 150,
            fit: BoxFit.cover,
          ),
          showImage: true,
          title: GFListTile(
            titleText: widget.title,
            subTitleText: widget.price,
          ),
          content: Column(
            children: <Widget>[
              Text(widget.description),
              Text("\nAmount: " + widget.amount.toString()),
            ],
          ),
          buttonBar: GFButtonBar(
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_sharp)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.cancel_sharp)),
            ],
          ),
        ),
      ],
    );
  }
}
