import 'package:flutter_catalog/core/CatalogStore.dart';
import 'package:store_keeper/store_keeper.dart';

import 'catalog.dart';
import 'item.dart';

class CartModel {
  CatalogModel _catalog = CatalogModel();
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newModel) {
    _catalog = newModel;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends Mutation<CatalogStore> {
  late final Item _item;

  AddMutation(this._item);

  @override
  exec() {
    store.cartModel._itemIds.add(_item.id);
  }
}

class RemoveMutation extends Mutation<CatalogStore> {
  late final Item _item;

  RemoveMutation(this._item);

  @override
  exec() {
    store.cartModel._itemIds.remove(_item.id);
  }
}
