import "package:flutter/material.dart";
import 'customTheme.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Trending Products",
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ],
    );
  }
}
