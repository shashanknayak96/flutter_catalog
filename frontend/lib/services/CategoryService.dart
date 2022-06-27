import 'dart:convert';
import 'dart:io';
import 'package:flutter_catalog/services/AbstractServices/AbstractCategoryService.dart';
import "package:http/http.dart" as http;
import '../models/category.dart';

class CategoryService extends AbstractCategoryService {
  @override
  Future<List<Category>> getCategories() async {
    List<Category> categoryList = [];
    try {
      await Future.delayed(Duration(seconds: 5));
      var categoryResponse = await http.get(
        Uri.parse(isPc ? pcUrl : laptopUrl + "/api/category"),
        headers: headers,
      );

      if (categoryResponse.statusCode == 200) {
        var decodedCategoryData = jsonDecode(categoryResponse.body);
        categoryList = List.from(decodedCategoryData["result"])
            .map<Category>((item) => Category.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }
    return categoryList;
  }
}
