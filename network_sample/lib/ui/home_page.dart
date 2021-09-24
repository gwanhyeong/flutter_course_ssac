import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:network_sample/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _title = '';

  @override
  void initState() {
    super.initState();

    fetch().then((todo) {
      setState(() {
        _title = todo.title;
      });
    });
  }

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
              fetch();
            },
            child: const Text('Fetch'),
          ),
          Text(_title),
        ],
      ),
    );
  }

  Future<Todo> fetch() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    return Todo.fromJson(jsonResponse);
  }
}
