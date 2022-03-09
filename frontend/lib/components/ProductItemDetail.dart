import "package:flutter/material.dart";
import 'package:flutter_catalog/models/product.dart';

class ProductItemDetail extends StatelessWidget {
  final Product product;

  const ProductItemDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
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
              child: Image.network(
                product.imageUrl,
                scale: 1.4,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 4,
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  "Sed takimata eirmod vero clita sed sanctus nonumy dolor, clita amet dolore invidunt sanctus. Tempor et et sanctus aliquyam ea.Nonumy rebum accusam dolor ea amet ut ipsum sea tempor diam, sadipscing diam voluptua et clita rebum eirmod rebum et, dolor dolore dolores consetetur ipsum consetetur ipsum kasd nonumy erat, vero vero aliquyam diam ipsum amet diam, dolor at gubergren sanctus tempor dolor erat dolore takimata. Justo at lorem sed.",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
