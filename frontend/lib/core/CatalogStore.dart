import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:store_keeper/store_keeper.dart';

class CatalogStore extends Store {
  late CatalogModel catalogModel;
  late CartModel cartModel;
  late AdvertisementItemList advertisementListModel;

  CatalogStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;

    advertisementListModel = AdvertisementItemList();
  }
}
