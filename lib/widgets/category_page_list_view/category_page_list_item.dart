// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CategoryPageListItem extends StatefulWidget {
  final String item;
  final String price;
  final String description;
  final String pictureLink;

  const CategoryPageListItem(
      this.item, this.price, this.description, this.pictureLink,
      {Key? key})
      : super(key: key);

  @override
  _CategoryPageListItemState createState() => _CategoryPageListItemState();
}

class _CategoryPageListItemState extends State<CategoryPageListItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GFCard(
          elevation: 4,
          boxFit: BoxFit.fill,
          titlePosition: GFPosition.start,
          image: Image.asset(
            widget.pictureLink,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          showImage: true,
          title: GFListTile(
            titleText: widget.item,
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

// class _CategoryPageListItemState extends State<CategoryPageListItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget> [
//           Image.asset(
//                   widget.pictureLink,
//                   height: 150,
//                   width: 150,
//                   fit: BoxFit.cover,
//                 ),
//           Text(
//             widget.title,
//             textDirection: TextDirection.ltr,
//             style: TextStyle(
//                 fontSize: 25
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//          ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   widget.items[0],
//                   style: TextStyle(
//                       fontSize: 15
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//                 Text(
//                   widget.prices[0],
//                   style: TextStyle(
//                       fontSize: 20
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   widget.items[1],
//                   style: TextStyle(
//                       fontSize: 15
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//                 Text(
//                   widget.prices[1],
//                   style: TextStyle(
//                       fontSize: 20
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   widget.items[2],
//                   style: TextStyle(
//                       fontSize: 15
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//                 Text(
//                   widget.prices[2],
//                   style: TextStyle(
//                       fontSize: 20
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   widget.items[3],
//                   style: TextStyle(
//                       fontSize: 15
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//                 Text(
//                   widget.prices[3],
//                   style: TextStyle(
//                       fontSize: 20
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   widget.items[4],
//                   style: TextStyle(
//                       fontSize: 15
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//                 Text(
//                   widget.prices[4],
//                   style: TextStyle(
//                       fontSize: 20
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//
//                 ),
//               ],
//             ),
//           ),
//         ],
//
//       ),
//
//
//
//
//
//       height: 300.0,
//       width: 120.0,
//         decoration: BoxDecoration(
//         color: Colors.blue,
//         border: Border.all(
//         color: Colors.black,
//         width: 2.0,
//         ),
//         borderRadius: BorderRadius.all(
//             Radius.circular(10)
//         ),
//       ),
//
//
//     );
//   }
//   // Widget build(BuildContext context) {
//   //   return Wrap(
//   //     children: [
//   //       GFCard(
//   //         elevation: 4,
//   //         boxFit: BoxFit.fill,
//   //         titlePosition: GFPosition.start,
//   //         image: Image.asset(
//   //           'assets/sample.png',
//   //           height: 180,
//   //           width: 150,
//   //           fit: BoxFit.cover,
//   //         ),
//   //         showImage: true,
//   //         title: GFListTile(
//   //           titleText: widget.title,
//   //           subTitleText: widget.price,
//   //         ),
//   //         content: Text(widget.description),
//   //         buttonBar: GFButtonBar(
//   //           children: <Widget>[],
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
// }
