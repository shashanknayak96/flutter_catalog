import 'package:flutter/material.dart';
import 'package:flutter_catalog/components/customTheme.dart';
import 'package:flutter_catalog/pages/homepage.dart';
import 'package:flutter_catalog/pages/loginpage.dart';
import 'package:flutter_catalog/pages/testPage.dart';
import 'package:flutter_catalog/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      theme: CustomTheme.lightTheme(context),
      // darkTheme: CustomTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (content) => LoginPage(),
        MyRoutes.testRoute: (content) => TestPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
