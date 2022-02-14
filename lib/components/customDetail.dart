import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Expanded(
            child: Column(
              children: [
                Hero(
                  tag: Key(item.id.toString()),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Image.network(
                      item.image,
                      scale: 1.4,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: CustomTheme.bluishGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.desc,
                          style: TextStyle(
                            color: CustomTheme.bluishGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${item.price}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(16),
              ),
              onPressed: () {},
              child: Text(
                "Add To Cart",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
