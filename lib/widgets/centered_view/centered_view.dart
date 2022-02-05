import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 1200,
        ),
        child: child,
      ),
    );
  }
}
