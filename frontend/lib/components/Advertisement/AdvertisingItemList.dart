import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Shimmer/CustomShimmer.dart';

import '../../models/advertisementItem.dart';
import '../../services/AdvertisementService.dart';
import '../../services/AbstractServices/AbstractAdvertisementService.dart';
import '../../services/ServiceLocator.dart';
import 'AdvertisingItem.dart';
import '../customScrollBehavior.dart';

class CustomAdvertisingItemList extends StatefulWidget {
  // final List<AdvertisementItem> advertisementItems;
  const CustomAdvertisingItemList({Key? key}) : super(key: key);

  @override
  State<CustomAdvertisingItemList> createState() =>
      _CustomAdvertisingListState();
}

class _CustomAdvertisingListState extends State<CustomAdvertisingItemList> {
  final int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  );
  List<AdvertisementItem> advertisementItemsTest = [];
  final AbstractAdvertisementService _advertisementService =
      getIt<AbstractAdvertisementService>();

  @override
  void initState() {
    super.initState();
    loadData();
    // _timer = Timer.periodic(
    //   Duration(seconds: 5),
    //   (Timer timer) {
    //     if (_currentPage < 3) {
    //       _currentPage++;
    //     } else {
    //       _currentPage = 0;
    //     }

    //     // _pageController.animateToPage(
    //     //   _currentPage,
    //     //   duration: Duration(milliseconds: 350),
    //     //   curve: Curves.easeInCubic,
    //     // );
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomBehavior(),
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: advertisementItemsTest.isEmpty
                    ? 2
                    : advertisementItemsTest.length,
                itemBuilder: (context, index) {
                  return advertisementItemsTest.isEmpty
                      ? CustomShimmer(
                          height: 200,
                          width: double.infinity,
                          padding: 8.0,
                          roundedCorners: true,
                        )
                      : CustomAdvertisingItem(
                          item: advertisementItemsTest[index]);
                },
              ),
            ),
          ),
          // SmoothPageIndicator(
          //   controller: _pageController,
          //   count: 4, // widget.advertisementItems.length,
          //   effect: WormEffect(
          //     dotHeight: 8,
          //     dotWidth: 12,
          //     type: WormType.normal,
          //     activeDotColor: Theme.of(context).indicatorColor,
          //   ),
          // ),
        ],
      ),
    );
  }

  void loadData() async {
    advertisementItemsTest = await _advertisementService.getAdvertisements();
    setState(() {});
  }
}
