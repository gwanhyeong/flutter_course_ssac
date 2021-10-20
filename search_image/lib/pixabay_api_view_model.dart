import 'dart:async';

import 'package:search_image/model/pixabay_api_result.dart';
import 'package:search_image/pixabay_api.dart';

class PixabayApiViewModel {
  final _api = PixabayApi();
  final _streamController = StreamController<PixabayApiResult>();

  Stream<PixabayApiResult> get apiStream => _streamController.stream;

  void fetch(String keyword) {
    _api.fetchImages(keyword).then((result) {
      _streamController.add(result);
    });
  }
}
