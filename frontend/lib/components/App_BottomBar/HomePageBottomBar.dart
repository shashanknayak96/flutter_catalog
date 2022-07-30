import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Common/CartCountIndicator.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_keeper/store_keeper.dart';

import '../../pages/cartpage.dart';

class HomePageBottomBar extends StatefulWidget {
  const HomePageBottomBar({Key? key}) : super(key: key);

  @override
  State<HomePageBottomBar> createState() => _HomePageBottomBarState();
}

class _HomePageBottomBarState extends State<HomePageBottomBar> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;
  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation, DeleteProductMutation]);
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      color: Color(0xff64FCD9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FaIcon(FontAwesomeIcons.home,
              color: Theme.of(context).iconTheme.color),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FaIcon(FontAwesomeIcons.shoppingCart,
                    color: Theme.of(context).iconTheme.color),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: CartCountIndicator(
                    count: _cart.products.length.toString(),
                  ),
                ),
              ],
            ),
          ),
          FaIcon(FontAwesomeIcons.userAlt,
              color: Theme.of(context).iconTheme.color),
        ],
      ),
    );
  }
}
