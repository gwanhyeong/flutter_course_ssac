import 'package:search_image/model/search_result_item.dart';

class SearchResult {
  SearchResult({
    int? total,
    int? totalHits,
    List<SearchResultItem>? hits,
  }) {
    _total = total;
    _totalHits = totalHits;
    _hits = hits;
  }

  SearchResult.fromJson(dynamic json) {
    _total = json['total'];
    _totalHits = json['totalHits'];
    if (json['hits'] != null) {
      _hits = [];
      json['hits'].forEach((v) {
        _hits?.add(SearchResultItem.fromJson(v));
      });
    }
  }
  int? _total;
  int? _totalHits;
  List<SearchResultItem>? _hits;

  int? get total => _total;
  int? get totalHits => _totalHits;
  List<SearchResultItem>? get hits => _hits;

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
