import 'item.dart';

class CatalogModel {
  List<Item> items = [];

  Item getById(int id) {
    return items.firstWhere((element) => element.id == id);
  }

  Item? getByPosition(int id) {
    return items[id];
  }
}
