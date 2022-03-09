import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -1,
      right: -1,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Color(0xff64FCD9),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            print("Bookmark");
          },
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 16,
          ),
        ),
      ),
    );
  }
}
