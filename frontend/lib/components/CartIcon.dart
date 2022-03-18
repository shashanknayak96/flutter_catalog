import "package:flutter/material.dart";
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartIcon extends StatelessWidget {
  final Product product;
  const CartIcon({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -1,
      right: -1,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Color(0xff64FCD9),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            AddProductMutation(product);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item added to cart!'),
              duration: Duration(seconds: 1),
            ));
          },
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 16,
          ),
        ),
      ),
    );
  }
}
