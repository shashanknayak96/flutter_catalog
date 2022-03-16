import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CartPageAppBar.dart';
import 'package:flutter_catalog/components/Cart/CartList.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:store_keeper/store_keeper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartPageAppBar(),
      body: Column(
        children: [
          Expanded(
            child: CartList(),
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
    StoreKeeper.listen(context, to: [AddMutation, RemoveMutation]);
    return !_cart.items.isNotEmpty
        ? Center(
            child: Text("No items added to cart yet.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                )),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: Image.network(_cart.items[index].image),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                ),
                title: Text(_cart.items[index].name),
              ),
            ),
          );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;

  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context, to: [AddMutation, RemoveMutation]);
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
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor:
                        Theme.of(context).snackBarTheme.backgroundColor,
                    content: Text("Buy functionality will be added soon!"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).buttonColor),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 32.0,
                  right: 32.0,
                ),
                child: Text(
                  "BUY",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
