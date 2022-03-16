import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartListItem extends StatelessWidget {
  final Product product;
  const CartListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(product.imageUrl),
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
                        product.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        product.price.toString() + "₹",
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
                            FaIcon(
                              FontAwesomeIcons.plusCircle,
                              size: Theme.of(context).iconTheme.size,
                              color: Theme.of(context).iconTheme.color,
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
                                Text("2",
                                    style:
                                        Theme.of(context).textTheme.headline2)
                              ],
                            ),
                            FaIcon(
                              FontAwesomeIcons.minusCircle,
                              size: Theme.of(context).iconTheme.size,
                              color: Theme.of(context).iconTheme.color,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.dumpster,
                          size: 18,
                          color: Theme.of(context).iconTheme.color,
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
