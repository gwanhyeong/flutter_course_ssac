import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:subway_info/model/seoul_subway_result.dart';

const apiUrl =
    'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5';

Future<SeoulSubwayResult> fetchData(String stationName) async {
  final url = Uri.parse('$apiUrl/$stationName');
  http.Response response = await http.get(url);

  if (response.statusCode != 200) {
    throw 'API\'s statusCode is not 200.';
  }

  dynamic jsonResponse = convert.jsonDecode(response.body);
  return SeoulSubwayResult.fromJson(jsonResponse);
}
