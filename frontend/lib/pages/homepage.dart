import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Advertisement/AdvertisingItemList.dart';
import 'package:flutter_catalog/components/App_BottomBar/HomePageAppBar.dart';
import 'package:flutter_catalog/components/App_BottomBar/HomePageBottomBar.dart';
import 'package:flutter_catalog/components/Button/CustomButtonTest.dart';
import 'package:flutter_catalog/components/Button/NotificationPage.dart';
import 'package:flutter_catalog/components/CategoryButton/CategoryButtomItemList.dart';
import 'package:flutter_catalog/components/Drawer/OptionsDrawer.dart';
import 'package:flutter_catalog/components/ProductGrid/ProductGridItemList.dart';
import 'package:flutter_catalog/components/customScrollBehavior.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import '../components/App_BottomBar/CustomButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final int age = 25;
  final String name = "Shashank";
  String data = "SOMETHING";

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("test"),
            content: Text("contnet"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Dont Allow"),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context));
                },
                child: Text("Allow"),
              )
            ],
          ),
        );
      }
    });

    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 1));
    // var catalogString =
    //     await rootBundle.loadString("assets/files/catalog.json");
    // var decodedData = jsonDecode(catalogString);
    // var productData = decodedData["products"];
    // CatalogModel.items =
    //     List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    // SIGNALR Implementation

    // The location of the SignalR Server.
    const serverUrl = "http://192.168.31.100/message";
    // Creates the connection by using the HubConnectionBuilder.
    // var hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
    // print(serverUrl);
    // print("Starting signalr server");

    // await hubConnection.start();
    // When the connection is closed, print out a message to the console.

    // hubConnection.on("ReceiveMessage", _receiveMessageFromServer);
    // hubConnection.onclose((error) => print("Connection Closed"));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: OptionsDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).buttonColor,
      //   onPressed: () {
      //     Navigator.pushNamed(context, MyRoutes.cartRoute);
      //   },
      //   child: Icon(
      //     CupertinoIcons.cart,
      //     color: Colors.white,
      //   ),
      // ),
      body: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButtonTest(),
                  NotificationPage(),
                  CustomAdvertisingItemList(),
                  CategoryButtonItemList(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "CURRENTLY TRENDING",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  ProductGridItemList(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomePageBottomBar(),
    );
  }

  void _receiveMessageFromServer(var message) {
    if (message != "" || message != null) {
      setState(() {
        data = message[0].toString();
      });
      print(message);
    }
  }
}
