import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_catalog/components/CategoryButton.dart';
import 'package:flutter_catalog/components/CategoryButtonList.dart';
import 'package:flutter_catalog/components/CustomAdvertisingList.dart';
import 'package:flutter_catalog/components/customButton.dart';
import 'package:flutter_catalog/components/customDeliveryAddress.dart';
import 'package:flutter_catalog/components/OptionsDrawer.dart';
import 'package:flutter_catalog/components/customHeader.dart';
import 'package:flutter_catalog/components/customList.dart';
import 'package:flutter_catalog/components/customSearchBar.dart';
import 'package:flutter_catalog/components/customTheme.dart';
import 'package:flutter_catalog/components/HomePageAppBar.dart';
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/models/category.dart';
import 'package:flutter_catalog/models/categoryList.dart';
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

    await loadAdvertisementData();
    await loadCategoryList();

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
                CategoryButtonList(
                  categoryList: CategoryList.items,
                ),
                Text("CURRENTLY TRENDING"),
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

  loadAdvertisementData() async {
    try {
      var advertisementResponse = await http.get(
        Uri.parse("http://192.168.31.101:8084/api/advertisement"),
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
        AdvertisementItemList.items = List.from(decodedAdvertisementData)
            .map<AdvertisementItem>((item) => AdvertisementItem.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }
  }

  loadCategoryList() async {
    try {
      var categoryResponse = await http.get(
        Uri.parse("http://192.168.31.101:8084/api/category"),
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

      if (categoryResponse.statusCode == 200) {
        var decodedCategoryData = jsonDecode(categoryResponse.body);
        CategoryList.items = List.from(decodedCategoryData)
            .map<Category>((item) => Category.fromJson(item))
            .toList();

        print("___________" + CategoryList.items.toString());
      }
    } on SocketException {
      print("No internet connection.");
    }
  }
}
