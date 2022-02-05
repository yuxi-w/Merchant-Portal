import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _NavBarItem('Home'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Category'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Shopping Cart'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('My Info')
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;

  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
