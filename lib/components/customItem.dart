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
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.desc,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
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
                              color: Theme.of(context).primaryColor),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
