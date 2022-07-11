import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractAuthenticationService.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractCategoryService.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractProductService.dart';
import 'package:flutter_catalog/services/AdvertisementService.dart';
import 'package:flutter_catalog/services/AuthenticationService.dart';
import 'package:get_it/get_it.dart';

import 'AbstractServices/AbstractAdvertisementService.dart';
import 'CategoryService.dart';
import 'ProductService.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<AbstractAdvertisementService>(
      () => AdvertisementService());
  getIt.registerLazySingleton<AbstractCategoryService>(() => CategoryService());
  getIt.registerLazySingleton<AbstractProductService>(() => ProductService());
  getIt.registerLazySingleton<AbstractAuthenticationService>(
      () => AuthenticationService());
}
