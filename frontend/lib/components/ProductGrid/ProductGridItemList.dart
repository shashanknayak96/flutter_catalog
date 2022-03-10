import "package:flutter/material.dart";
import 'package:flutter_catalog/models/product.dart';

import 'ProductGridItem.dart';
import '../customScrollBehavior.dart';

class ProductGridItemList extends StatelessWidget {
  final List<Product> products;

  const ProductGridItemList({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
          ),
          itemBuilder: (context, index) {
            return ProductGridItem(product: products[index]);
          },
        ),
      ),
    );
  }
}
