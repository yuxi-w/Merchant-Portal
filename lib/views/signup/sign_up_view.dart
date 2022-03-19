import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:merchant_app/constants/constants/AppConst.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/routing/route_names.dart';
import 'package:merchant_app/services/navigation_service.dart';
import 'package:merchant_app/widgets/home_page_footer/home_page_footer.dart';
import 'package:merchant_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:merchant_app/constants/methods/validation_methods.dart';

/// This is the Sign Up page
class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final signupformkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _zip = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String dropdownValue = "Client";
  bool success = false;
  String isBuyer = "true";
  String errmsg = "temp";

  Future<void> signup(
      String name, email, pass, address, phone, zipcode, isBuyer) async {
    try {
      Response response = await post(
        Uri.parse('${baseUrl}shopuser/Createbykeys').replace(queryParameters: {
          'name': name,
          'email': email,
          'password': pass,
          'address': address,
          'profilePicture': "temp",
          'phoneNumber': phone,
          'zipcode': zipcode,
          'isBuyer': isBuyer,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = (response.body.toString());
        print(data);
        print("success");
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

        /// Main Content
        Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  height: 900,
                  width: 540,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Padding(
                      //padding: const EdgeInsets.all(60.0),
                      padding: const EdgeInsets.fromLTRB(120, 60, 120, 60),
                      child: Form(
                        key: signupformkey,
                        child: ListView(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Center(
                              child: Text(
                                "Enter your details below",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const SizedBox(height: 24),

                            const Center(
                              child: Text("Signup as: "),
                            ),

                            //Dropdown button
                            Center(
                              child: SizedBox(
                                width: 100,
                                height: 40,
                                child: DropdownButton(
                                  key: const Key("signupTypeSelection"),
                                  isExpanded: true,
                                  value: dropdownValue,
                                  items: <String>['Client', 'Merchant']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(
                                      () {
                                        dropdownValue = newValue!;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// Full Name Text Field
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Full Name"),
                              ),
                              validator: NameFieldValidator.validate,
                              controller: _name,
                            ),
                            //const SizedBox(height: 24),

                            // Email address Text Field
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Email Address"),
                                hintText: "abc@xyz.com",
                              ),
                              validator: EmailFieldValidator.validate,
                              controller: _email,
                            ),

                            // Phone Number Text Field
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Phone Number"),
                                hintText: "10 digit phone number 1231231231",
                              ),
                              validator: PhoneFieldValidator.validate,
                              controller: _phone,
                            ),

                            //Address Text Field
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Address"),
                                hintText: "ex 123 Nelson, Ottawa, ON, CA",
                              ),
                              validator: EmptyFieldValidator.validate,
                              controller: _address,
                            ),

                            /// Zip Code Text Field
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Zip Code"),
                                hintText: "ex. K1N7N8",
                              ),
                              validator: ZipcodeFieldValidator.validate,
                              controller: _zip,
                            ),

                            /// Password Text Field
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                label: Text("Password"),
                                hintText: "Please write your password",
                              ),
                              controller: _pass,
                              validator: EmptyFieldValidator.validate,
                            ),

                            /// Re enter Password Text Field
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                label: Text("Reenter Password"),
                                hintText: "Please reenter your password",
                              ),
                              controller: _confirmPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please confirm your password";
                                } else if (value != _pass.text) {
                                  return "Password dosen't match";
                                } else {
                                  return null;
                                }
                              },
                            ),

                            const SizedBox(height: 24),
                            MaterialButton(
                              onPressed: () async {
                                if (signupformkey.currentState!.validate()) {
                                  //onpress goes here
                                  if (dropdownValue == "Client") {
                                    isBuyer = "true";
                                  } else {
                                    isBuyer = "false";
                                  }
                                  await signup(
                                      _name.text.toString(),
                                      _email.text.toString(),
                                      _pass.text.toString(),
                                      _address.text.toString(),
                                      _phone.text.toString(),
                                      _zip.text.toString(),
                                      isBuyer);
                                  if (success) {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      text:
                                          "Signup Successful! \nPlease login to continue",
                                      // onConfirmBtnTap: () {
                                      //   Navigator.pop(context);
                                      // },
                                    );
                                    goToSignInPage();
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
                              child: const Text("Signup"),
                              minWidth: double.infinity,
                              height: 52,
                              elevation: 24,
                              color: Colors.amber.shade700,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                            const SizedBox(height: 32),
                            TextButton(
                              key: const Key("login_redirect_button"),
                              onPressed: () {
                                goToSignInPage();
                              },
                              child: const Text(
                                "Already have an account? Click here to Login!",
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),

        /// Footer
        const HomePageFooter()
      ],
    );
  }

  void goToSignInPage() {
    locator<NavigationService>().navigateTo(LoginRoute, null);
  }
}
