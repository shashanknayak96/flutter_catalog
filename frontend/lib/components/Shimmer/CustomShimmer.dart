import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomShimmer extends StatefulWidget {
  final double width;
  final double height;
  final double padding;
  final bool roundedCorners;

  const CustomShimmer(
      {Key? key,
      required this.width,
      required this.height,
      required this.roundedCorners,
      required this.padding})
      : super(key: key);

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
