import "package:flutter/material.dart";
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:store_keeper/store_keeper.dart';

import 'CartListItem.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;
  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation, DeleteProductMutation]);
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: _cart.products.length,
        itemBuilder: (context, index) => CartListItem(
          product: _cart.products[index],
        ),
      ),
    );
  }
}
