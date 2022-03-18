import "package:flutter/material.dart";
import 'package:flutter_catalog/components/ProductGrid/ProductItemDetail.dart';
import 'package:flutter_catalog/components/Common/TrendingIcon.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:flutter_catalog/pages/ProductDetailPage.dart';

import '../CartIcon.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;

  const ProductGridItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xff041C32),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Hero(
                        tag: product.id,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          width: 175,
                          height: 175,
                        ),
                      ),
                    ),
                  ),
                ),
                if (product.isTrending) TrendingIcon(),
                CartIcon(product: product),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
