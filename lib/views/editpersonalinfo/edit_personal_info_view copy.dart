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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 156, 156),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(300, 16, 300, 16),
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
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'new custommer',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                width: 1350.0,
                height: 20.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Text(
                'Change Phone Number:',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Card(
                color: Colors.white70,
                child: new Container(
                  padding: EdgeInsets.all(5.0),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 25.0),
                              child: ListTile(
                                leading: Icon(
                                  Icons.phone,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          new Expanded(
                            child: new TextField(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              ///this is the first card!
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    '+1 123 1231231',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Text(
                'Change Email Address:',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    'Merchant-user1@gmail.com',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Text(
                'Change Password:',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.security_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    'Enter your old password',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.password_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    'Enter your new password',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.password_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  title: Text(
                    'Confirm your new password',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
