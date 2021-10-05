import 'dart:convert' as convert;
import 'package:conference_app/model/conference.dart';
import 'package:http/http.dart' as http;

const String referenceUrl =
    'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';

Future<List<Conference>> fetchList() async {
  Uri url = Uri.parse(referenceUrl);
  final response = await http.get(url);

  Iterable jsonResponse = convert.jsonDecode(response.body);
  return jsonResponse
      .map((conference) => Conference.fromJson(conference))
      .toList();
}
