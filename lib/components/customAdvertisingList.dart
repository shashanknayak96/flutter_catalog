import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/advertisementItemList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'customAdvertisingItem.dart';
import 'customScrollBehavior.dart';

class CustomAdvertisingList extends StatefulWidget {
  final List<AdvertisementItem> advertisementItems;
  const CustomAdvertisingList({Key? key, required this.advertisementItems})
      : super(key: key);

  @override
  State<CustomAdvertisingList> createState() => _CustomAdvertisingListState();
}

class _CustomAdvertisingListState extends State<CustomAdvertisingList> {
  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentPage < 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        // _pageController.animateToPage(
        //   _currentPage,
        //   duration: Duration(milliseconds: 350),
        //   curve: Curves.easeInCubic,
        // );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomBehavior(),
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: widget.advertisementItems.length,
                itemBuilder: (context, index) {
                  return CustomAdvertisingItem(
                      item: widget.advertisementItems[index]);
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 4, // widget.advertisementItems.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 12,
              type: WormType.normal,
              activeDotColor: Theme.of(context).indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
