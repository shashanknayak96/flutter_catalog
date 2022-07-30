import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:store_keeper/store_keeper.dart';

class CatalogStore extends Store {
  late CartModel cartModel;

  CatalogStore() {
    cartModel = CartModel();
  }
}
