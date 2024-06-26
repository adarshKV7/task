// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:may_model_exam/model/res_model.dart';

class HomeScreenController with ChangeNotifier {
  List<ResModel>? resModels;

  Future getData() async {
    Uri url = Uri.parse(
        "http://universities.hipolabs.com/search?country=United+States");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var convertedData = resModelFromJson(res.body);
      resModels = convertedData;
      notifyListeners();
      log(res.body);
    } else {
      print("Failed");
    }
  }
}
