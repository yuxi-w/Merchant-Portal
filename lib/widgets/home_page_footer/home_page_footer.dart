// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:footer/footer.dart';
import 'package:flutter/material.dart';

class HomePageFooter extends StatefulWidget {
  const HomePageFooter({Key? key}) : super(key: key);

  @override
  _HomePageFooterState createState() => _HomePageFooterState();
}

class _HomePageFooterState extends State<HomePageFooter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Footer(
        backgroundColor: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.home,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.fingerprint,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.call,
                                  size: 20.0,
                                ),
                                color: const Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const Text(
                  'Copyright ©2022, All Rights Reserved.',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF162A49)),
                ),
                const Text(
                  'Powered by Group 6',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF162A49)),
                ),
              ]),
        ),
      ),
    );
  }
}
