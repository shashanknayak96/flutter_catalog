import "package:flutter/material.dart";
import 'package:flutter_catalog/models/product.dart';

class ProductItemDetail extends StatelessWidget {
  final Product product;

  const ProductItemDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            Hero(
              tag: product.id,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    scale: 1.4,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MRP",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "₹500",
                    style: TextStyle(
                      color: Color(0xff041C32),
                      fontSize: 20.0,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DEAL PRICE",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text("₹400",
                      style: TextStyle(
                        color: Color(0xff041C32),
                        fontSize: 20.0,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              ),
              child: Text(
                "Sed takimata eirmod vero clita sed sanctus nonumy dolor, clita amet dolore invidunt sanctus. Tempor et et sanctus aliquyam ea.Nonumy rebum accusam dolor ea amet ut ipsum sea tempor diam, sadipscing diam voluptua et clita rebum eirmod rebum et, dolor dolore dolores consetetur ipsum consetetur ipsum kasd nonumy erat, vero vero aliquyam diam ipsum amet diam, dolor at gubergren sanctus tempor dolor erat dolore takimata. Justo at lorem sed.",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
