import 'AbstractService.dart';

abstract class AbstractProductService extends AbstractService {
  getProducts() {}
  getProductsByCategory(String categoryId) {}
}
