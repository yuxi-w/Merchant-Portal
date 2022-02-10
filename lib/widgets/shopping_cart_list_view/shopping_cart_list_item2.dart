// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ShopCartListItem2 extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final int amount;

  const ShopCartListItem2(this.title, this.price, this.description, this.amount, {Key? key})
      : super(key: key);

  @override
  _ShopCartListItem1State createState() => _ShopCartListItem1State();
}

class _ShopCartListItem1State extends State<ShopCartListItem2> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GFCard(
          elevation: 4,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,
          image: Image.network(
            'https://m.media-amazon.com/images/I/A1GbblX7rOL._AC_AA180_.jpg',
            height: 180,
            width: 130,
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
            children: <Widget>[IconButton(onPressed: (){}, icon: Icon(Icons.add_sharp)),
              IconButton(onPressed: (){}, icon: Icon(Icons.cancel_sharp)),
              ],
          ),
        ),
      ],
    );
  }
}
