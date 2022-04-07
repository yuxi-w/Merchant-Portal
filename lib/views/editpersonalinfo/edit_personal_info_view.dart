import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';

import 'package:merchant_app/constants/constants/globals.dart' as globals;

class EditPersonalInfoView extends StatefulWidget {
  const EditPersonalInfoView({Key? key}) : super(key: key);

  /// This is the editing page for personal information
  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<EditPersonalInfoView> {
  final editinfoformkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController(text: globals.name);
  final TextEditingController _email =
      TextEditingController(text: globals.email);
  final TextEditingController _phone =
      TextEditingController(text: globals.phoneNumber);
  final TextEditingController _address =
      TextEditingController(text: globals.address);
  final TextEditingController _zip =
      TextEditingController(text: globals.zipcode);
  final TextEditingController _pass =
      TextEditingController(text: globals.password);
  final TextEditingController _confirmPass =
      TextEditingController(text: globals.password);
  bool success = false;
  String errmsg = "temp";

  Future<void> getUserInfo(String id) async {
    try {
      Response response = await get(Uri.parse('${baseUrl}shopuser/$id'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var parsedjson = (jsonDecode(response.body));
        globals.name = parsedjson['name'];
        globals.profilePicture = parsedjson['profilePicture'];
        globals.phoneNumber = parsedjson['phoneNumber'];
        globals.email = parsedjson['email'];
        globals.address = parsedjson['address'];
        globals.zipcode = parsedjson['zipcode'];
        globals.password = parsedjson['password'];
        globals.isBuyer = parsedjson['isBuyer'];
        globals.shoppingBag = parsedjson['shoppingBag'];
        globals.orderHistory = parsedjson['orderHistory'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print('Failed to load user list');
      }
    } catch (e) {
      print('${baseUrl}shopuser/$id');
      print("here");
      print(e.toString());
    }
  }

  Future<void> editinfo(
      String name, email, pass, address, phone, zipcode, id) async {
    try {
      Map mybody = {};
      mybody['name'] = name;
      mybody['email'] = email;
      mybody['password'] = pass;
      mybody['address'] = address;
      mybody['profilePicture'] = "temp";
      mybody['phoneNumber'] = phone;
      mybody['zipcode'] = zipcode;
      mybody['isBuyer'] = globals.isBuyer;
      mybody['isLoggedIn'] = globals.isLoggedIn;
      mybody['shoppingBag'] = globals.shoppingBag;
      mybody['orderHistory'] = globals.orderHistory;
      String str = jsonEncode(mybody);
      Response response = await put(
        Uri.parse('${baseUrl}shopuser/$id'),
        body: str,
        headers: {"Content-Type": "application/json"},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("success");
        globals.name = name;
        globals.email = email;
        globals.password = pass;
        globals.address = address;
        globals.phoneNumber = phone;
        globals.zipcode = zipcode;
        setState(() {
          success = true;
        });
      } else {
        var data = (response.body.toString());
        print(data);
        print("fail");
        setState(() {
          success = false;
          errmsg = data;
        });
      }
    } catch (e) {
      setState(() {
        success = false;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Top Navigation Bar
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 64, 16),
          child: const MyNavigationBar(),
        ),

        /// Main content of the page
        Form(
          key: editinfoformkey,
          child: Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: Container(
                constraints:
                    const BoxConstraints(minWidth: 900, maxWidth: 1300),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// This is the top page picture of the user
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('./assets/logo.png'),
                    ),

                    /// Smaller container!
                    Container(
                        constraints:
                            const BoxConstraints(minWidth: 500, maxWidth: 800),
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          /// Edit name section
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

                          /// Edit name field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "First Name - Last Name",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              validator: NameFieldValidator.validate,
                              controller: _name,
                            ),
                          ),

                          /// Edit phone number section
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

                          /// Edit phone number field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "1231231231",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              validator: PhoneFieldValidator.validate,
                              controller: _phone,
                            ),
                          ),

                          /// Edit email address section
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

                          /// Edit email address field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Merchant-user1@gmail.com",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              validator: EmailFieldValidator.validate,
                              controller: _email,
                            ),
                          ),

                          /// Edit address section
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

                          /// Edit address field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "129 Ashburn, Ottawa, ON, CA",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              validator: EmptyFieldValidator.validate,
                              controller: _address,
                            ),
                          ),

                          /// Edit zip code field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "K2N-0A8",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              validator: ZipcodeFieldValidator.validate,
                              controller: _zip,
                            ),
                          ),

                          /// Edit passwords section
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

                          /// Edit passwords field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter new password",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              controller: _pass,
                            ),
                          ),

                          /// Edit repasswords field section
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Re enter new password",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              controller: _confirmPass,
                              validator: (value) {
                                if (value != _pass.text) {
                                  return "Password dosen't match";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          /// Buttons section
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
                                    key: const Key("editinfo_cancel_button"),
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 22, 10, 22),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    color:
                                        const Color.fromARGB(255, 241, 75, 53),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 21),
                                    ),
                                    onPressed: () {
                                      goToPersonalInfoPage();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 215, maxWidth: 380),
                                  child: MaterialButton(
                                    key: const Key("editinfo_save_button"),
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 22, 10, 22),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    color: Colors.blue,
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 21),
                                    ),
                                    onPressed: () async {
                                      if (editinfoformkey.currentState!
                                          .validate()) {
                                        //onpress goes here
                                        await getUserInfo(globals.id);
                                        await editinfo(
                                            _name.text.toString(),
                                            _email.text
                                                .toString()
                                                .toLowerCase(),
                                            _pass.text.toString(),
                                            _address.text.toString(),
                                            _phone.text.toString(),
                                            _zip.text.toString(),
                                            globals.id);
                                        if (success) {
                                          CoolAlert.show(
                                            context: context,
                                            type: CoolAlertType.success,
                                            text: "Changes made successfully!",
                                            // onConfirmBtnTap: () {
                                            //   Navigator.pop(context);
                                            // },
                                          );
                                          goToPersonalInfoPage();
                                        } else {
                                          CoolAlert.show(
                                            context: context,
                                            type: CoolAlertType.error,
                                            title: 'Oops...',
                                            text: errmsg,
                                            loopAnimation: false,
                                          );
                                        }
                                      }
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
          ),
        ),

        /// Footer
        const HomePageFooter()
      ],
    );
  }

  void goToPersonalInfoPage() {
    locator<NavigationService>().navigateTo(PersonalInfoRoute, null);
  }
}
