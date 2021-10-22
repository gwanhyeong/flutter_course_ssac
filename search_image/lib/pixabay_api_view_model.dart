import 'package:flutter/material.dart';
import 'package:search_image/model/pixabay_api_result.dart';
import 'package:search_image/pixabay_api.dart';

class PixabayApiViewModel with ChangeNotifier {
  final _api = PixabayApi();
  PixabayApiResult? _result;
  PixabayApiResult? get result => _result;

  void fetch(String keyword) {
    _api.fetchImages(keyword).then((result) {
      _result = result;
      notifyListeners();
    });
  }
}
