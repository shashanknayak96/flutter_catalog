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
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: CustomTheme.bluishGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.desc,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CustomTheme.bluishGrey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "At diam ipsum gubergren dolores sit nonumy et sanctus. Duo consetetur voluptua sanctus magna dolor sed, et et et et sed et clita ea accusam, kasd dolor dolore stet nonumy et sadipscing vero aliquyam sea. Takimata sea et ipsum at labore. Duo rebum kasd invidunt no diam takimata sea, dolor.",
                                  style: TextStyle(
                                    color: CustomTheme.bluishGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
                primary: CustomTheme.amazonBlue,
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
