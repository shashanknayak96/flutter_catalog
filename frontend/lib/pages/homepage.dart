import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_catalog/components/customAdvertisingList.dart';
import 'package:flutter_catalog/components/customDeliveryAddress.dart';
import 'package:flutter_catalog/components/customDrawer.dart';
import 'package:flutter_catalog/components/customHeader.dart';
import 'package:flutter_catalog/components/customList.dart';
import 'package:flutter_catalog/components/customSearchBar.dart';
import 'package:flutter_catalog/components/customTheme.dart';
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:flutter_catalog/utils/routes.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final int age = 25;
  final String name = "Shashank";

  @override
  void initState() {
    super.initState();
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

    try {
      var advertisementResponse = await http.get(
        Uri.parse("http://localhost:5020/api/advertisement"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials":
              "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        },
      );
      if (advertisementResponse.statusCode == 200) {
        var decodedAdvertisementData = jsonDecode(advertisementResponse.body);
        print(decodedAdvertisementData);
        AdvertisementItemList.items = List.from(decodedAdvertisementData)
            .map<AdvertisementItem>((item) => AdvertisementItem.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }

    // await rootBundle.loadString("assets/files/advertisements.json");
    // if (advertisementResponse.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   var decodedAdvertisementData = jsonDecode(advertisementResponse.body);
    //   AdvertisementItemList.items = List.from(decodedAdvertisementData)
    //       .map<AdvertisementItem>((item) => AdvertisementItem.fromJson(item))
    //       .toList();
    // }

    // var decodedAdvertisementData = jsonDecode(advertisementString);
    // var advertisementData = decodedAdvertisementData["advertisements"];

    // AdvertisementItemList.items = List.from(advertisementData)
    //     .map<AdvertisementItem>((item) => AdvertisementItem.fromJson(item))
    //     .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomDeliveryAddress(),
                CustomAdvertisingList(
                  advertisementItems: AdvertisementItemList.items,
                ),

                // Ads
                // Footer?

                // CustomList(
                //   products: CatalogModel.items,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
