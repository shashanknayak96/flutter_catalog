import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Advertisement/AdvertisingItemList.dart';
import 'package:flutter_catalog/components/App_BottomBar/HomePageAppBar.dart';
import 'package:flutter_catalog/components/App_BottomBar/HomePageBottomBar.dart';
import 'package:flutter_catalog/components/CategoryButton/CategoryButtomItemList.dart';
import 'package:flutter_catalog/components/Drawer/OptionsDrawer.dart';
import 'package:flutter_catalog/components/ProductGrid/ProductGridItemList.dart';
import 'package:flutter_catalog/components/customScrollBehavior.dart';
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:flutter_catalog/models/category.dart';
import 'package:flutter_catalog/models/categoryList.dart';
import 'package:flutter_catalog/models/product.dart';
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
    await loadProductList();
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
                  // CustomDeliveryAddress(),
                  CustomAdvertisingItemList(
                    advertisementItems: AdvertisementItemList.items,
                  ),
                  CategoryButtonItemList(
                    categoryList: CategoryList.items,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "CURRENTLY TRENDING",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  ProductGridItemList(products: ProductList.products),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomePageBottomBar(),
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
      }
    } on SocketException {
      print("No internet connection.");
    }
  }

  loadProductList() async {
    try {
      var productResponse = await http.get(
        Uri.parse("http://192.168.31.101:8084/api/product"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": "true",
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        },
      );

      if (productResponse.statusCode == 200) {
        var decodedProductData = jsonDecode(productResponse.body);
        ProductList.products = List.from(decodedProductData)
            .map<Product>((item) => Product.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }
  }
}
