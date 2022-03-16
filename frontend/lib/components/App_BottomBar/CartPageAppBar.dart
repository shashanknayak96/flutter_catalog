import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Drawer/OptionsDrawer.dart';
import '../Common/CartCountIndicator.dart';

class CartPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const CartPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onLongPress: null,
            onTap: () {
              Navigator.pop(context, false);
            },
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
          ),
        ),
        title: Text("YOUR CART", style: Theme.of(context).textTheme.headline1),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
