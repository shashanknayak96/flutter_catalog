import "package:flutter/material.dart";
import 'package:flutter_catalog/components/CategoryButton/CategoryButtomItem.dart';
import 'package:flutter_catalog/components/Shimmer/CustomShimmer.dart';
import 'package:flutter_catalog/models/category.dart';
import 'package:flutter_catalog/services/AbstractServices/AbstractCategoryService.dart';

import '../../services/ServiceLocator.dart';
import '../customScrollBehavior.dart';

class CategoryButtonItemList extends StatefulWidget {
  const CategoryButtonItemList({Key? key}) : super(key: key);

  @override
  State<CategoryButtonItemList> createState() => _CategoryButtonItemListState();
}

class _CategoryButtonItemListState extends State<CategoryButtonItemList> {
  List<Category> categoryList = [];
  final AbstractCategoryService _categoryService =
      getIt<AbstractCategoryService>();

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        margin: EdgeInsets.all(5.0),
        height: 35.0,
        child: ScrollConfiguration(
          // This removes the scroll glow
          behavior: CustomBehavior(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.isEmpty ? 5 : categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: categoryList.isEmpty
                    ? CustomShimmer(
                        width: 100.0,
                        height: 35.0,
                        padding: 0.0,
                        roundedCorners: true,
                      )
                    : CategoryButtonItem(
                        category: categoryList[index],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  void loadCategories() async {
    categoryList = await _categoryService.getCategories();
    setState(() {});
  }
}
