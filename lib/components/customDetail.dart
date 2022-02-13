import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';

import 'customTheme.dart';

class CustomDetail extends StatelessWidget {
  final Item item;
  const CustomDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: CustomTheme.whitishGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Expanded(
            child: Column(
              children: [
                Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image),
                ),
                Expanded(
                  child: Container(
                    child: Text(item.desc),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
