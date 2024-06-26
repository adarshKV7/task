import 'package:flutter/material.dart';
import 'package:may_model_exam/model/photo_screen_model.dart';

class ProductScreenController with ChangeNotifier {
  List placeList = [];
  ZippoModel? zippoModel;

  Map<String, dynamic> postCode = {
    "post code": "33162",
    "country": "United States",
    "country abbreviation": "US",
    "places": [
      {
        "place name": "Miami",
        "longitude": "-80.183",
        "state": "Florida",
        "state abbreviation": "FL",
        "latitude": "25.9286"
      },
      {
        "place name": "MiIndiami",
        "longitude": "-80.183",
        "state": "Florida",
        "state abbreviation": "FL",
        "latitude": "25.9286"
      }
    ]
  };

  void convertedData() {
    zippoModel = ZippoModel.fromJson(postCode);
    notifyListeners();
  }
}
