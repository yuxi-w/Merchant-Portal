import 'dart:html';

import 'package:flutter/material.dart';
import 'package:merchant_app/views/personalinfo/personal_info_view.dart';

class EditPersonalInfoView extends StatefulWidget {
  const EditPersonalInfoView({Key? key}) : super(key: key);

  ///This is the editig page for personal information

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<EditPersonalInfoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Container(
          constraints: const BoxConstraints(minWidth: 900, maxWidth: 1300),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// this is the top page picture of the user
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('./assets/logo.png'),
              ),

              ///smaller container!
              Container(
                  constraints:
                      const BoxConstraints(minWidth: 500, maxWidth: 800),
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    ///Edit name section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: const Text(
                          'Edit name:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),

                    ///Edit name field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "First Name - Last Name",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit phone number section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: const Text(
                          'Edit phone number:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),

                    ///Edit phone number field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "+1 123 1231231",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit email address section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: const Text(
                          'Edit email address:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),

                    ///Edit email address field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Merchant-user1@gmail.com",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit address section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: const Text(
                          'Edit address:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),

                    ///Edit address field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "129 Ashburn, Ottawa, ON, CA",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit zip code field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "K2N 0A8",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit passwords section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: const Text(
                          'Change password:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),

                    ///Edit passwords field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter new password",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///Edit repasswords field section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Reenter new password",
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),

                    ///buttons section
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Row(
                        ///Row
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 215, maxWidth: 380),
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 22, 10, 22),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              color: const Color.fromARGB(255, 241, 75, 53),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 21),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalInfoView()),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 215, maxWidth: 380),
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 22, 10, 22),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              color: Colors.blue,
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 21),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalInfoView()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
