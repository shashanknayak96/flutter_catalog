import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool showSearchBar = false;
  Icon searchIcon = const Icon(
    CupertinoIcons.search_circle_fill,
    color: Color(0xff041C32),
  );
  Widget searchBar = const Text(
    "Catalog App",
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xff041C32),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: searchBar,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (!showSearchBar) {
                // Show it
                searchIcon = Icon(
                  Icons.cancel,
                  color: Theme.of(context).iconTheme.color,
                );

                searchBar = ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  title: TextField(
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      // filled:true ,
                      // fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, top: 8.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      focusColor: Theme.of(context).backgroundColor,
                      hoverColor: Theme.of(context).backgroundColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      hintText: "Search Catalog",
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                  ),
                );

                showSearchBar = !showSearchBar;
              } else {
                // Hide it
                searchIcon = Icon(
                  CupertinoIcons.search_circle_fill,
                  color: Theme.of(context).iconTheme.color,
                );
                searchBar = Text(
                  "Catalog App",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                );
                showSearchBar = !showSearchBar;
              }
            });
          },
          icon: searchIcon,
        )
      ],
    );
  }
}
