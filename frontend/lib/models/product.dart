import 'package:flutter_catalog/models/category.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final Category category;
  final bool isTrending;

  Product({
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.isTrending,
    required this.id,
    required this.name,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      imageUrl: map["imageUrl"],
      price: map["price"],
      category: map["category"],
      isTrending: map["isTrending"],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      category: Category.fromJson(json["category"]),
      isTrending: json["isTrending"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "description": "description",
        "imageUrl": "imageUrl",
        "price": "price",
        "category": "category",
        "isTrending": "isTrending",
      };
}

class ProductList {
  static List<Product> products = [];

  Product getById(String id) {
    return products.firstWhere((x) => x.id == id);
  }
}
