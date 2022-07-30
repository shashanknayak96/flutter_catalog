import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:flutter_catalog/utils/routes.dart';

import '../../models/product.dart';
import '../../services/AbstractServices/AbstractProductService.dart';
import '../../services/ServiceLocator.dart';
import '../customDetail.dart';
import '../customItem.dart';
import 'ProductItem.dart';

class ProductListItems extends StatefulWidget {
  // final List<Item> products;
  final String categoryId;

  const ProductListItems({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListItems> createState() => _ProductListItemsState();
}

class _ProductListItemsState extends State<ProductListItems> {
  List<Product> productList = [];
  final AbstractProductService _productService =
      getIt<AbstractProductService>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final catalog = productList[index];
            return InkWell(
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CustomDetail(
              //       item: catalog,
              //     ),
              //   ),
              // ),
              child: ProductItem(product: catalog),
            );
          },
        ),
      ),
    );
  }

  loadData() async {
    productList =
        await _productService.getProductsByCategory(widget.categoryId);
    setState(() {});
  }
}
