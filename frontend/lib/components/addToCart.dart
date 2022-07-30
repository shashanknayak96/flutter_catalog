import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:store_keeper/store_keeper.dart';

import '../models/product.dart';

class AddToCart extends StatelessWidget {
  final Product product;

  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (StoreKeeper.store as CatalogStore).cartModel;
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation]);
    bool isInCart = _cart.products.contains(product);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Item added to cart."),
          ),
        );
        if (!isInCart) AddProductMutation(product);
      },
      child: isInCart
          ? Icon(Icons.check, color: Colors.white)
          : Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
    );
  }
}
