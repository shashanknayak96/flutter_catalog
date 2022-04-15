import 'package:flutter/material.dart';
import 'package:flutter_catalog/components/Theme/customTheme.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/pages/cartpage.dart';
import 'package:flutter_catalog/pages/homepage.dart';
import 'package:flutter_catalog/pages/loginpage.dart';
import 'package:flutter_catalog/pages/testPage.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:store_keeper/store_keeper.dart';

void main() {
  runApp(StoreKeeper(
    store: CatalogStore(),
    child: MyApp(),
  ));
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
        MyRoutes.cartRoute: (content) => CartPage(),
        MyRoutes.testRoute: (content) => TestPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
