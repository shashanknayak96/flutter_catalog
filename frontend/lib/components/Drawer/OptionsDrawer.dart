import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_catalog/components/Theme/customTheme.dart';
import 'package:flutter_catalog/models/user.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../models/session.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class OptionsDrawer extends StatefulWidget {
  @override
  State<OptionsDrawer> createState() => _OptionsDrawerState();
}

class _OptionsDrawerState extends State<OptionsDrawer> {
  final String profilePic = "https://dummyimage.com/500X500/ffedbf/000000.jpg";
  UserResponseModel? user;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    user = await FlutterSession().get(session().userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: scaffoldKey,
      backgroundColor: lightBlue,
      child: Container(
        padding: EdgeInsets.zero,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            (UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: lightBlue,
              ),
              accountName: Text(
                "Shashank",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                "shashank96.nayak@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(profilePic),
              ),
            )),
            ListTile(
              tileColor: lightBlue,
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              textColor: Colors.black,
            ),
            ListTile(
              tileColor: lightBlue,
              leading: Icon(
                CupertinoIcons.info,
                color: Colors.black,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              textColor: Colors.black,
            ),
            ListTile(
              tileColor: lightBlue,
              leading: Icon(
                CupertinoIcons.arrow_2_circlepath_circle_fill,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              textColor: Colors.black,
              onTap: () async {
                await FlutterSession().set(session().accessToken, "");
                await FlutterSession().set(session().refreshToken, "");
                await FlutterSession().set(session().userId, "");
                Navigator.of(context).pushReplacementNamed(MyRoutes.loginRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
