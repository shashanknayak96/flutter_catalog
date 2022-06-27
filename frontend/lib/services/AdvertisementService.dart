import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:flutter_catalog/services/AbstractServices/AbstractAdvertisementService.dart';
import '../models/advertisementItem.dart';

class AdvertisementService extends AbstractAdvertisementService {
  @override
  Future<List<AdvertisementItem>> getAdvertisements() async {
    List<AdvertisementItem> advertisementList = [];
    try {
      await Future.delayed(Duration(seconds: 2));
      var advertisementResponse = await http.get(
        Uri.parse((isPc ? pcUrl : laptopUrl) + "api/advertisement"),
        headers: headers,
      );
      if (advertisementResponse.statusCode == 200) {
        var decodedAdvertisementData = jsonDecode(advertisementResponse.body);
        advertisementList = List.from(decodedAdvertisementData["result"])
            .map<AdvertisementItem>((item) => AdvertisementItem.fromJson(item))
            .toList();
      }
    } on SocketException {
      print("No internet connection.");
    }
    return advertisementList;
  }
}
