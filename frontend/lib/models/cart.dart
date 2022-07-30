import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:flutter_catalog/models/cart_product.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:store_keeper/store_keeper.dart';

class CartModel {
  ProductList _productList = ProductList();
  final List<CartProduct> _products = [];

  get products =>
      _products.map((x) => _productList.getById(x.productId)).toList();

  int productCount(String id) =>
      _products.firstWhere((x) => x.productId == id).count;

  num get totalPrice => products.fold(0, (total, current) => total + 1);
}

class AddProductMutation extends Mutation<CatalogStore> {
  late final Product _product;

  AddProductMutation(this._product);

  @override
  exec() {
    var productList = store.cartModel._products;
    var productIndex =
        productList.indexWhere((x) => x.productId == _product.id);

    if (productIndex != -1) {
      productList[productIndex].count++;
    } else {
      var newProduct = CartProduct(count: 1, productId: _product.id);
      store.cartModel._products.add(newProduct);
    }
  }
}

class RemoveProductMutation extends Mutation<CatalogStore> {
  late final Product _product;

  RemoveProductMutation(this._product);

  @override
  exec() {
    var productList = store.cartModel._products;

    var productIndex =
        productList.indexWhere((x) => x.productId == _product.id);
    var product = store.cartModel._products[productIndex];

    if (product.count == 1) {
      DeleteProductMutation(_product);
    } else {
      product.count--;
      store.cartModel._products[productIndex] = product;
    }
  }
}

class DeleteProductMutation extends Mutation<CatalogStore> {
  late final Product _product;

  DeleteProductMutation(this._product);

  @override
  exec() {
    var productList = store.cartModel._products;
    var productIndex =
        productList.indexWhere((x) => x.productId == _product.id);

    productList.removeAt(productIndex);
  }
}
