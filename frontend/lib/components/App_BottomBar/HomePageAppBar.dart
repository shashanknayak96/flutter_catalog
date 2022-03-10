import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Drawer/OptionsDrawer.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

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
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: FaIcon(
              FontAwesomeIcons.bars,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
          ),
        ),
        title: Text(
          "SOME SHOPPING APP",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0),
            child: FaIcon(
              FontAwesomeIcons.search,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
