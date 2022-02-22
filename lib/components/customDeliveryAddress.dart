import 'dart:ffi';

import "package:flutter/material.dart";

class CustomDeliveryAddress extends StatelessWidget {
  const CustomDeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        color: Colors.red,
        child: SizedBox(
          height: 50.0,
          child: ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.location_on),
            title: Text(
              "Deliver to Shashank Nayak",
            ),
          ),
        ));
  }
}
