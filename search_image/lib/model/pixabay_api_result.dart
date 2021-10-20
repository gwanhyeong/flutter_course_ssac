import 'package:search_image/model/pixabay_api_image.dart';

class PixabayApiResult {
  PixabayApiResult({
    int? total,
    int? totalHits,
    List<PixabayApiImage>? hits,
  }) {
    _total = total;
    _totalHits = totalHits;
    _hits = hits;
  }

  PixabayApiResult.fromJson(dynamic json) {
    _total = json['total'];
    _totalHits = json['totalHits'];
    if (json['hits'] != null) {
      _hits = [];
      json['hits'].forEach((v) {
        _hits?.add(PixabayApiImage.fromJson(v));
      });
    }
  }
  int? _total;
  int? _totalHits;
  List<PixabayApiImage>? _hits;

  int? get total => _total;
  int? get totalHits => _totalHits;
  List<PixabayApiImage>? get hits => _hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['totalHits'] = _totalHits;
    if (_hits != null) {
      map['hits'] = _hits?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
