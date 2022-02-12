import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class CustomDrawer extends StatelessWidget {
  final String profilePic = "https://dummyimage.com/500X500/ffedbf/000000.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue.shade300,
      child: Container(
        padding: EdgeInsets.zero,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: (UserAccountsDrawerHeader(
                accountName: Text("Shashank"),
                accountEmail: Text("shashank96.nayak@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(profilePic),
                ),
              )),
            ),
            ListTile(
              tileColor: Colors.lightBlue.shade300,
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
              tileColor: Colors.lightBlue.shade300,
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
              contentPadding: EdgeInsets.all(10),
              selectedTileColor: Colors.green,
              tileColor: Colors.red.shade200,
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
            )
          ],
        ),
      ),
    );
  }
}
