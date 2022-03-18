import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CustomButton.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Text(
                  "Welcome to Amazon Lite",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
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
                      cursorColor: Theme.of(context).primaryColor,
                      initialValue: "shashank96.nayak@gmail.com",
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
                        initialValue: "Password@123",
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
                    // CustomButton(
                    //   buttonName: "Login",
                    //   color: Colors.lightBlue.shade200,
                    //   action: moveToHomePage,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // CustomButton(
                    //   buttonName: "Register",
                    //   color: Colors.lightBlue.shade600,
                    // )
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
