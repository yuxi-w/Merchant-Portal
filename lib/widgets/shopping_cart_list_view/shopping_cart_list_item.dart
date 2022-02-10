// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ShopCartListItem extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final int amount;
  final String imageSrc;

  const ShopCartListItem(this.title, this.price, this.description, this.amount, this.imageSrc, {Key? key})
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
          
          image: Image.network(
            widget.imageSrc,
            height: 180,
            width: 130,
            fit: BoxFit.cover,
            // alignment: Alignment.centerLeft,
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
              IconButton(onPressed: (){}, icon: Icon(Icons.add_sharp)),
              IconButton(onPressed: (){}, icon: Icon(Icons.cancel_sharp)),
            ],
          ),
        ),
      ],
    );
  }
}
