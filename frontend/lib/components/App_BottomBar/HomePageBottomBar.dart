import "package:flutter/material.dart";
import 'package:flutter_catalog/pages/CartPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageBottomBar extends StatelessWidget {
  const HomePageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      color: Color(0xff64FCD9),
      // decoration: BoxDecoration(
      //   color: Color(0xff64FCD9), backgroundBlendMode: BlendMode.clear,
      //   // borderRadius: BorderRadius.circular(20),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: FaIcon(FontAwesomeIcons.home,
                color: Theme.of(context).iconTheme.color),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: FaIcon(FontAwesomeIcons.shoppingCart,
                  color: Theme.of(context).iconTheme.color),
            ),
          ),
          Container(
            child: FaIcon(FontAwesomeIcons.userAlt,
                color: Theme.of(context).iconTheme.color),
          ),
        ],
      ),
    );
  }
}
