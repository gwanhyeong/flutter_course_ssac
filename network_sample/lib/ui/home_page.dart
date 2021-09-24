import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              var url =
                  Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
              http.get(url).then((response) {
                if (response.statusCode == 200) {
                  final jsonResponse = convert.jsonDecode(response.body);
                  setState(() {
                    _title = jsonResponse['title'];
                  });
                }
              });
            },
            child: const Text('Fetch'),
          ),
          Text(_title),
        ],
      ),
    );
  }
}
