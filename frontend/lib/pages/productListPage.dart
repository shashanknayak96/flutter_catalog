import 'package:flutter/material.dart';
import 'package:flutter_catalog/components/ProductList/ProductItem.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractProductService.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/App_BottomBar/DetailPageAppBar.dart';
import '../components/ProductList/ProductList.dart';
import '../components/customDetail.dart';

import '../models/product.dart';
import '../services/ServiceLocator.dart';

class ProductListPage extends StatefulWidget {
  final String categoryName;

  const ProductListPage({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DetailPageAppBar(),
      body: Column(
        children: [
          ProductListItems(categoryId: widget.categoryName),
        ],
      ),
    );
  }

  void loadData() async {
    productList =
        await _productService.getProductsByCategory(widget.categoryName);
    setState(() {});
  }
}
