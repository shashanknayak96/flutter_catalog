import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:store_keeper/store_keeper.dart';

class CatalogStore extends Store {
  late CatalogModel catalogModel;
  late CartModel cartModel;

  CatalogStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
  }
}
