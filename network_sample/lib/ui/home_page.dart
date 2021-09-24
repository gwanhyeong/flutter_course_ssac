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

    fetch();
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

  void fetch() {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        Todo todo = Todo.fromJson(jsonResponse);
        setState(() {
          _title = todo.title;
        });
      }
    });
  }
}
