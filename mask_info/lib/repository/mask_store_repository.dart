import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mask_info/model/mask_store.dart';

class MaskStoreRepository {
  static const apiUrl =
      'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';

  Future<List<MaskStore>> fetch() async {
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> stores = json['stores'];
      return stores.map((store) => MaskStore.fromJson(store)).toList();
    }

    throw Exception('API\'s statusCode is not 200');
  }
}
