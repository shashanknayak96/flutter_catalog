import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';

import 'customItem.dart';

class CustomList extends StatelessWidget {
  final List<Item> products;

  const CustomList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final catalog = products[index];
          return CustomItem(item: catalog);
        },
      ),
    );
  }
}
