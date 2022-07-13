import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CustomButton.dart';
import 'package:flutter_catalog/components/Theme/customTheme.dart';
import 'package:flutter_catalog/models/user.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_session/flutter_session.dart';

import '../components/Button/ActionButton.dart';
import '../models/session.dart';
import '../services/AbstractServices/AbstractAuthenticationService.dart';
import '../services/ServiceLocator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController(text: "s@gmail.com");
  final password = TextEditingController(text: "123");

  final AbstractAuthenticationService _authenticationService =
      getIt<AbstractAuthenticationService>();

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  color: Colors.white,
                  height: 50,
                ),
                height: 50,
              ),
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Center(
                  child: Text(
                    "SOME SHOPPING APP",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your username or email address",
                        labelText: "Username/Email",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username/Email cannot be null";
                        }
                      },
                    ),
                    TextFormField(
                        controller: password,
                        obscureText: true,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Enter your password",
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be null";
                          } else if (value.length <= 6) {
                            return "Password cannot be less than 6 characters";
                          }
                        }),
                    SizedBox(
                      height: 60,
                    ),
                    ActionButton(
                      buttonText: "Login",
                      color: lightBlue,
                      onTap: () async {
                        UserResponseModel response =
                            await _authenticationService.login(
                          UserLoginModel(
                            email: email.text,
                            password: password.text,
                          ),
                        );
                        if (response != null) {
                          print("ATLOGIN");
                          print(response);
                          await FlutterSession()
                              .set(session().userModel, response);
                          Navigator.of(context)
                              .pushReplacementNamed(MyRoutes.homeRoute);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text("Invalid Email or Password."),
                            ),
                          );
                        }
                      },
                    ),
                    ActionButton(
                      buttonText: "Register",
                      color: white,
                      onTap: () {
                        Navigator.of(context).pushNamed(MyRoutes.registerRoute);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  moveToHomePage(BuildContext context) async {
    if (_formKey.currentState == null) return null;
    if (_formKey.currentState!.validate()) {
      // setState(() {
      //   changeButton = true;
      // });
      // await Future.delayed(Duration(seconds: 3));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      // setState(() {
      //   changeButton = false;
      // });
    }
  }

  showAlertBox() {}
}
