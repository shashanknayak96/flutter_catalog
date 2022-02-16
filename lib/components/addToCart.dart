import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:store_keeper/store_keeper.dart';

class AddToCart extends StatelessWidget {
  final Item item;

  const AddToCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (StoreKeeper.store as CatalogStore).cartModel;
    StoreKeeper.listen(context, to: [AddMutation, RemoveMutation]);
    bool isInCart = _cart.items.contains(item);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        if (!isInCart) AddMutation(item);
      },
      child: isInCart
          ? Icon(Icons.check, color: Colors.white)
          : Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
    );
  }
}
