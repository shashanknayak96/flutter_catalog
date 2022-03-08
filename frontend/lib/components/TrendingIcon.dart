import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrendingIcon extends StatelessWidget {
  const TrendingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -1,
      top: -1,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Color(0xff64FCD9),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: FaIcon(
          FontAwesomeIcons.bolt,
          size: 16,
        ),
      ),
    );
  }
}
