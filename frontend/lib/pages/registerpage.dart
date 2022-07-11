import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CustomButton.dart';
import 'package:flutter_catalog/components/Theme/customTheme.dart';
import 'package:flutter_catalog/models/user.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_session/flutter_session.dart';

import '../components/Button/ActionButton.dart';
import '../services/AbstractServices/AbstractAuthenticationService.dart';
import '../services/ServiceLocator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController(text: "Shashank Nayak");
  final email = TextEditingController(text: "s@gmail.com");
  final password = TextEditingController(text: "123");

  final AbstractAuthenticationService _authenticationService =
      getIt<AbstractAuthenticationService>();

  bool? response;

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
              Image.asset("assets/images/welcome_image.png", fit: BoxFit.cover),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Center(
                  child: Text(
                    "Please enter the following details",
                    style: TextStyle(
                      fontSize: 16,
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
                      controller: name,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        labelText: "Name",
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
                      buttonText: "Register",
                      color: lightBlue,
                      onTap: () async {
                        response = await _authenticationService.register(
                          UserRegisterModel(
                            name: name.text,
                            email: email.text,
                            password: password.text,
                          ),
                        );
                        if (response == true) {
                          Navigator.of(context)
                              .pushReplacementNamed(MyRoutes.loginRoute);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "Unable to save user. Please try again later."),
                            ),
                          );
                        }
                      },
                    ),
                    ActionButton(
                      buttonText: "Back to login",
                      color: white,
                      onTap: () {
                        Navigator.of(context).pushNamed(MyRoutes.loginRoute);
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
