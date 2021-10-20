import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:search_image/model/pixabay_api_result.dart';

class PixabayApi {
  // .env 활용할 수 있지만, 임시로 상수 사용
  static const _apiKey = '';
  static const _baseUrl = 'https://pixabay.com/api/';

  String _createSearchUrl(String keyword) {
    return '$_baseUrl?key=$_apiKey&q=$keyword&image_type=photo';
  }

  Future<PixabayApiResult> fetchImages(String keyword) async {
    final uri = Uri.parse(_createSearchUrl(keyword));
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return PixabayApiResult.fromJson(jsonResponse);
    }

    throw Exception('Response\'s statusCode is not 200');
  }
}
