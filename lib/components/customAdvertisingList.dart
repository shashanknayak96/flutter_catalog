import "package:flutter/material.dart";
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'customAdvertisingItem.dart';
import 'customScrollBehavior.dart';

class CustomAdvertisingList extends StatelessWidget {
  final List<AdvertisementItem> advertisementItems;
  const CustomAdvertisingList({Key? key, required this.advertisementItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 1, keepPage: true);

    return Container(
      height: 180.0,
      child: Column(children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: CustomBehavior(),
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemCount: advertisementItems.length,
              itemBuilder: (context, index) {
                return CustomAdvertisingItem(item: advertisementItems[index]);
              },
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: advertisementItems.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 10,
            type: WormType.normal,
            activeDotColor: Theme.of(context).primaryColorDark,
          ),
        ),
      ]),
    );
  }
}
