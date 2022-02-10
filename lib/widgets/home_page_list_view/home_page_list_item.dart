// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePageListItem extends StatefulWidget {
  final String title;
  final String price;
  final String description;

  const HomePageListItem(this.title, this.price, this.description, {Key? key})
      : super(key: key);

  @override
  _HomePageListItemState createState() => _HomePageListItemState();
}

class _HomePageListItemState extends State<HomePageListItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GFCard(
          elevation: 4,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,
          image: Image.asset(
            'assets/sample.png',
            height: 180,
            width: 150,
            fit: BoxFit.cover,
          ),
          showImage: true,
          title: GFListTile(
            titleText: widget.title,
            subTitleText: widget.price,
          ),
          content: Text(widget.description),
          buttonBar: GFButtonBar(
            children: <Widget>[],
          ),
        ),
      ],
    );
  }
}
