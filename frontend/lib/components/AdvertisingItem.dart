import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter_catalog/models/advertisementItem.dart';
import 'package:flutter_catalog/models/item.dart';

class CustomAdvertisingItem extends StatelessWidget {
  final AdvertisementItem item;
  const CustomAdvertisingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
