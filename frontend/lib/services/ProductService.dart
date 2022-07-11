import 'dart:convert';
import 'dart:io';
import 'package:flutter_catalog/Middleware/HttpInterceptor.dart';
import "package:http/http.dart" as http;
import 'package:http_interceptor/http_interceptor.dart';
import '../models/product.dart';
import 'AbstractServices/AbstractProductService.dart';

class ProductService extends AbstractProductService {
  @override
  Future<List<Product>> getProducts() async {
    List<Product> productList = [];

    try {
      // await Future.delayed(Duration(seconds: 5));
      var productResponse = await client.get(
        Uri.parse(isPc ? pcUrl : laptopUrl + "api/product/trending"),
        headers: headers,
      );

      if (productResponse.statusCode == 200) {
        var decodedProductData = jsonDecode(productResponse.body);
        productList = List.from(decodedProductData["result"])
            .map<Product>((item) => Product.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }
    return productList;
  }
}
