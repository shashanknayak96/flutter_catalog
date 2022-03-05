import "package:flutter/material.dart";
import 'package:flutter_catalog/components/CategoryButton.dart';
import 'package:flutter_catalog/models/category.dart';

import 'customScrollBehavior.dart';

class CategoryButtonList extends StatelessWidget {
  final List<Category> categoryList;

  const CategoryButtonList({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        margin: EdgeInsets.all(5.0),
        height: 50.0,
        child: ScrollConfiguration(
          // This removes the scroll glow
          behavior: CustomBehavior(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CategoryButton(
                  category: categoryList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
