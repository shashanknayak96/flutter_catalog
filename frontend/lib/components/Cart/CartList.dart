import "package:flutter/material.dart";
import 'package:flutter_catalog/models/category.dart';
import 'package:flutter_catalog/models/product.dart';

import 'CartListItem.dart';

final List<Product> products = [
  Product(
    description: "TEST",
    imageUrl:
        "https://images.unsplash.com/photo-1601460588655-109bd38204db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
    price: 123,
    category: new Category(id: "622379e5b56b3c76856c44e3", name: "Shoes"),
    isTrending: true,
    id: "622379e5b56b3c76856c44e3",
    name: "TEST",
  ),
];

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => CartListItem(
          product: products[0],
        ),
      ),
    );
  }
}
