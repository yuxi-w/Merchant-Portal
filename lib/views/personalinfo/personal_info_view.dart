import 'dart:html';

import 'package:flutter/material.dart';
import 'package:merchant_app/widgets/home_page_list_view/home_page_list_view.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
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
              Text(
                'First Name - Last Name',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 70, 70, 70)),
              ),
              Text(
                'new custommer',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 70, 70, 70),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                width: 1350.0,
                height: 20.0,
                child: Divider(
                  color: Color.fromARGB(255, 90, 38, 31),
                ),
              ),
              Container(
                  constraints: BoxConstraints(minWidth: 500, maxWidth: 800),
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      'Phone Number:',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        title: Text(
                          '+1 123 1231231',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),
                    Text(
                      'Email Address:',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.mark_email_unread_rounded,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        title: Text(
                          'Merchant-user1@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),
                    Text(
                      'Home Address:',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.fmd_good_rounded,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        title: Text(
                          '129 Ashburn, Ottawa, ON, CA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),
                    Text(
                      'Zip Code:',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.my_location_rounded,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        title: Text(
                          'K2N 0A8',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 70, 70, 70)),
                        ),
                      ),
                    ),
                    Text(
                      ' ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                      child: MaterialButton(
                        minWidth: double.maxFinite,
                        padding: const EdgeInsets.fromLTRB(65, 20, 65, 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        color: Colors.blue,
                        child: const Text(
                          "Edit your personal information!",
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                        onPressed: () {},
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
