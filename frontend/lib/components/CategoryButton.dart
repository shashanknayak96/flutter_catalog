import "package:flutter/material.dart";
import 'package:flutter_catalog/models/category.dart';

class CategoryButton extends StatelessWidget {
  final Category category;
  const CategoryButton({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 50,
          width: 150,
          curve: Curves.easeIn,
          alignment: Alignment.center,
          child: Text(
            category.name.toUpperCase(),
            style: Theme.of(context).textTheme.headline2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor, // added
            border: Border.all(), // added
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
