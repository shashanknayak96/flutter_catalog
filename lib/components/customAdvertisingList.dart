import "package:flutter/material.dart";
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';

import 'customAdvertisingItem.dart';
import 'customScrollBehavior.dart';

class CustomAdvertisingList extends StatelessWidget {
  final List<AdvertisementItem> advertisementItems;
  const CustomAdvertisingList({Key? key, required this.advertisementItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: Column(children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: CustomBehavior(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: advertisementItems.length,
              itemBuilder: (context, index) {
                return CustomAdvertisingItem(item: advertisementItems[index]);
              },
            ),
          ),
        ),
      ]),
    );
  }
}
