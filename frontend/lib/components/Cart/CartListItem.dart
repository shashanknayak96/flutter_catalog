import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_keeper/store_keeper.dart';

class CartListItem extends StatefulWidget {
  final Product product;
  const CartListItem({Key? key, required this.product}) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  final _cart = (StoreKeeper.store as CatalogStore).cartModel;

  @override
  Widget build(BuildContext context) {
    StoreKeeper.listen(context,
        to: [AddProductMutation, RemoveProductMutation, DeleteProductMutation]);
    return Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff64FCD9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1, // you can play with this value, by default it is 1
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.product.imageUrl),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        widget.product.price.toString() + "₹",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                AddProductMutation(widget.product);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.plusCircle,
                                size: Theme.of(context).iconTheme.size,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    _cart
                                        .productCount(widget.product.id)
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.headline2)
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                RemoveProductMutation(widget.product);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.minusCircle,
                                size: Theme.of(context).iconTheme.size,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            DeleteProductMutation(widget.product);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.trash,
                            size: 18,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
