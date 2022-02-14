import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';

import 'customImage.dart';
import 'customTheme.dart';

class CustomItem extends StatelessWidget {
  final Item item;

  const CustomItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: CustomImage(image: item.image),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomTheme.bluishGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(
                      color: CustomTheme.bluishGrey,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item.price}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.shopping_cart,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
