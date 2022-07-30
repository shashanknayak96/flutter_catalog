import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CartPageAppBar.dart';
import 'package:flutter_catalog/components/Cart/CartList.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:store_keeper/store_keeper.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartPageAppBar(),
      body: Column(
        children: [
          Expanded(
            child: _cart.products.isEmpty
                ? Text("Your cart is empty.")
                : CartList(),
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;
  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation]);
    return !_cart.products.isNotEmpty
        ? Center(
            child: Text("No items added to cart yet.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                )),
          )
        : ListView.builder(
            itemCount: _cart.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: Image.network(_cart.products[index].imageUrl),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    RemoveProductMutation(_cart.products[index]);
                  },
                ),
                title: Text(_cart.products[index].name),
              ),
            ),
          );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;

  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation]);
    return Container(
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$${_cart.totalPrice}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            // Expanded(
            //   child: CustomButton(
            //     buttonName: "BUY",
            //     color: Color(0xff64FCD9),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
