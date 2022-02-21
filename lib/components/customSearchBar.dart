import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Icon searchIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget searchBar = const Text(
    "Catalog App",
    style: TextStyle(
      color: Colors.white,
    ),
  );

  bool showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  color: Colors.white,
                );

                searchBar = ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  title: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
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
                  Icons.search,
                  color: Colors.white,
                );
                searchBar = Text(
                  "Catalog App",
                  style: TextStyle(
                    color: Colors.white,
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
