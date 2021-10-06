import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:search_image/model/search_result.dart';

// .env 활용할 수 있지만, 임시로 상수 사용
const apiKey = '';
const baseUrl = 'https://pixabay.com/api/';

String _createSearchUrl(String keyword) {
  return '$baseUrl?key=$apiKey&q=$keyword&image_type=photo';
}

Future<SearchResult> fetchSearchResult(String keyword) async {
  final uri = Uri.parse(_createSearchUrl(keyword));
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    return SearchResult.fromJson(jsonResponse);
  }

  throw Exception('Response\'s statusCode is not 200');
}
