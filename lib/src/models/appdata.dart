import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  List data = [];
  List favorites = [];

  bool hasFavorite(String cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(String cityName) {
    if (this.hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

  void setData(List newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get('https://api.b7web.com.br/flutter1wb/');

    if (res.statusCode == 200) {
      setData(jsonDecode(res.body));
      return true;
    } else {
      return false;
    }
  }
}
