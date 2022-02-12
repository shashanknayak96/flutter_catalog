import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_catalog/components/customDrawer.dart';
import 'package:flutter_catalog/components/customHeader.dart';
import 'package:flutter_catalog/components/customList.dart';
import 'package:flutter_catalog/components/customTheme.dart';
import 'package:flutter_catalog/models/catalog.dart';

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
    await Future.delayed(Duration(seconds: 4));
    var catalogString =
        await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogString);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.whitishGrey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CustomList(
                  products: CatalogModel.items,
                )
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
