import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Shimmer/CustomShimmer.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractProductService.dart';

import '../../services/ServiceLocator.dart';
import 'ProductGridItem.dart';
import '../customScrollBehavior.dart';

class ProductGridItemList extends StatefulWidget {
  const ProductGridItemList({Key? key}) : super(key: key);

  @override
  State<ProductGridItemList> createState() => _ProductGridItemListState();
}

class _ProductGridItemListState extends State<ProductGridItemList> {
  List<Product> productList = [];
  final AbstractProductService _productService =
      getIt<AbstractProductService>();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: productList.isEmpty ? 6 : productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
          ),
          itemBuilder: (context, index) {
            return productList.isEmpty //productList.isEmpty
                ? CustomShimmer(
                    width: 175,
                    height: 175,
                    padding: 8.0,
                    roundedCorners: true,
                  )
                : ProductGridItem(product: productList[index]);
          },
        ),
      ),
    );
  }

  void loadProducts() async {
    productList = await _productService.getProducts();
    setState(() {});
  }
}
