import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
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
import 'package:flutter_catalog/pages/loginpage.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:signalr_client/signalr_client.dart';

import '../components/App_BottomBar/CustomButton.dart';
import '../components/Theme/customTheme.dart';
import '../models/session.dart';
import '../models/user.dart';
import '../services/NotificationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final int age = 25;
  final String name = "Shashank";
  String data = "SOMETHING";
  bool loggedIn = false;

  var userModel;
  late UserResponseModel userModelJson;

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Catalog App"),
            content: Text(
              "Would you like to receive notifications from our application?",
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Dont Allow",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ))),
              TextButton(
                  onPressed: () {
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications()
                        .then((_) => Navigator.pop(context));
                  },
                  child: Text("Allow",
                      style: TextStyle(
                        color: lightBlue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
        );
      }
    });

    loadData();
  }

  loadData() async {
    // Check session
    print("Checking Session");
    userModel = await FlutterSession().get(session().userModel);
    userModelJson = UserResponseModel.toJson(userModel);
    print("AT HOMEPAGE");
    print(userModelJson);
    if (userModelJson.accessToken == "" || userModelJson.accessToken == null) {
      print("Session not found");
      // SchedulerBinding.instance?.addPostFrameCallback((_) {
      // Navigator.of(context).pushReplacementNamed(MyRoutes.loginRoute);
      // });
    } else {
      print("Session: " + userModelJson.accessToken);
      loggedIn = true;

      // SIGNALR Implementation
      // The location of the SignalR Server.
      // const serverUrl = "http://192.168.31.100/message";
      // // Creates the connection by using the HubConnectionBuilder.
      // var hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
      // print("Starting signalr server");

      // await hubConnection.start();
      // // When the connection is closed, print out a message to the console.

      // hubConnection.on("ReceiveMessage", _receiveMessageFromServer);
      // hubConnection.onclose((error) => print("Connection Closed"));
    }

    // await Future.delayed(Duration(seconds: 1));
    // var catalogString =
    //     await rootBundle.loadString("assets/files/catalog.json");
    // var decodedData = jsonDecode(catalogString);
    // var productData = decodedData["products"];
    // CatalogModel.items =
    //     List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return !loggedIn
        ? LoginPage()
        : Scaffold(
            appBar: HomePageAppBar(),
            drawer: OptionsDrawer(userModel: userModelJson),
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
                        ListTile(
                          tileColor: lightBlue,
                          title: Text(
                            "Logout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          textColor: Colors.black,
                          onTap: () async {
                            await FlutterSession()
                                .set(session().accessToken, "");
                            await FlutterSession()
                                .set(session().refreshToken, "");
                            await FlutterSession().set(session().userId, "");
                            Navigator.of(context)
                                .pushReplacementNamed(MyRoutes.loginRoute);
                          },
                        ),
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
    if (message == null) return;
    if (message != "" || message != null) {
      setState(() {
        createNotification("test", message[0].toString());
        data = message[0].toString();
      });
      print(message);
    }
  }
}
