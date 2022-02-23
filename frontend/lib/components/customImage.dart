import "package:flutter/material.dart";

import 'customTheme.dart';

class CustomImage extends StatelessWidget {
  final String image;

  const CustomImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.whitishGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SizedBox(
          width: 110,
          height: 110,
          child: Image.network(
            image,
            scale: 4,
          ),
        ),
      ),
    );
  }
}
