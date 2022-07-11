import 'package:flutter/material.dart';

class MessageSnackBar extends StatelessWidget {
  get _scaffoldKey => null;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      key: _scaffoldKey,
      body: const SnackBarPage(),
    ));
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
