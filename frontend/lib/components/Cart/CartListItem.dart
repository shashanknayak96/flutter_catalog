import "package:flutter/material.dart";
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
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1, // you can play with this value, by default it is 1
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
              ],

              //   children: [
              //     Flexible(
              //       flex: 1,
              //       child: SizedBox(
              //         height: 75,
              //         width: 100,
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(10),
              //           child: Image.network(
              //             product.imageUrl,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //             left: 8.0,
              //           ),
              //           child: Text(
              //             product.name,
              //             style: Theme.of(context).textTheme.headline3,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(
              //             left: 8.0,
              //           ),
              //           child: Text(
              //             product.price.toString() + "₹",
              //             style: Theme.of(context).textTheme.headline1,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Spacer(),
              //     Container(
              //       color: Colors.amber,
              //       child: Text("TRST"),
              //     ),
              //   ],
              // ),
            ),
          ),
        ));
  }
}
