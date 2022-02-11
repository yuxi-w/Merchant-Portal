import 'dart:html';

import 'package:flutter/material.dart';
import 'package:merchant_app/views/personalinfo/personal_info_view.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_view.dart';

class EditPersonalInfoView extends StatefulWidget {
  const EditPersonalInfoView({Key? key}) : super(key: key);

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<EditPersonalInfoView> {
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text("Personal Page"));
    //return const HomePageListView();
    return Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(minWidth: 900, maxWidth: 1300),
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.fromLTRB(300, 16, 300, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('./assets/logo.png'),
              ),
              Container(
                  constraints: BoxConstraints(minWidth: 500, maxWidth: 800),
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      'Edit name:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "First Name - Last Name",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Text(
                      'Edit phone number:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "+1 123 1231231",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Text(
                      'Edit email address:',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Merchant-user1@gmail.com",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Text(
                      'Edit address:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "129 Ashburn, Ottawa, ON, CA",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "K2N 0A8",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Text(
                      'Change password:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        obscureText: true,
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            // errorText: errorPass,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter new password",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextField(
                        obscureText: true,
                        //controller: password,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            // errorText: errorPass,
                            hintText: "Reenter new password",
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Row(
                        ///Row
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Container(
                            constraints:
                                BoxConstraints(minWidth: 225, maxWidth: 380),
                            //width: MediaQuery.of(context).size.width * 0.35,
                            child: MaterialButton(
                              //minWidth: double.maxFinite,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 30, 10, 30),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              color: Color.fromARGB(255, 241, 75, 53),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 21),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonalInfoView()),
                                );
                              },
                            ),
                          ),
                          Container(
                            constraints:
                                BoxConstraints(minWidth: 225, maxWidth: 380),
                            //width: MediaQuery.of(context).size.width * 0.35,
                            child: MaterialButton(
                              // minWidth: double.maxFinite,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 30, 10, 30),
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
                                      builder: (context) => PersonalInfoView()),
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
