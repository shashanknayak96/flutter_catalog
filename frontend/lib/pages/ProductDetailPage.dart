import "package:flutter/material.dart";
import 'package:flutter_catalog/components/App_BottomBar/CustomButton.dart';
import 'package:flutter_catalog/components/App_BottomBar/DetailPageAppBar.dart';
import 'package:flutter_catalog/components/ProductGrid/ProductItemDetail.dart';
import 'package:flutter_catalog/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DetailPageAppBar(),
      body: Column(
        children: [
          ProductItemDetail(
            product: product,
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        buttonName: "ADD TO CART",
        color: Color(0xff64FCD9),
        product: product,
      ),
    );
  }
}
