import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:flutter_catalog/utils/routes.dart';

import 'customDetail.dart';
import 'customItem.dart';

class CustomList extends StatelessWidget {
  final List<Item> products;

  const CustomList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final catalog = products[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomDetail(
                    item: catalog,
                  ),
                ),
              ),
              child: CustomItem(item: catalog),
            );
          },
        ),
      ),
    );
  }
}
