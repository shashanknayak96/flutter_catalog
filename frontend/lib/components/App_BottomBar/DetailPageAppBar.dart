import "package:flutter/material.dart";
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_keeper/store_keeper.dart';
import '../Common/CartCountIndicator.dart';

class DetailPageAppBar extends StatefulWidget with PreferredSizeWidget {
  const DetailPageAppBar({Key? key}) : super(key: key);

  @override
  State<DetailPageAppBar> createState() => _DetailPageAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _DetailPageAppBarState extends State<DetailPageAppBar> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;
  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation, DeleteProductMutation]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onLongPress: null,
            onTap: () {
              Navigator.pop(context, false);
            },
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0),
                child: FaIcon(
                  FontAwesomeIcons.shoppingCart,
                  color: Theme.of(context).iconTheme.color,
                  size: Theme.of(context).iconTheme.size,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child:
                    CartCountIndicator(count: _cart.products.length.toString()),
              ),
            ],
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
    );
  }
}
