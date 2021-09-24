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
  List<Todo> _list = [];

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
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              fetch();
            },
            child: const Text('Fetch item'),
          ),
          Text(_title),
          ElevatedButton(
            onPressed: () async {
              List<Todo> todos = await fetchList();
              setState(() {
                _list = todos;
              });
            },
            child: const Text('Fetch list'),
          ),
          if (_list.isEmpty)
            const Center(child: CircularProgressIndicator())
          else
            ..._list.map((todo) {
              return Text(todo.title);
            }),
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

  Future<List<Todo>> fetchList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);

    Iterable jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
  }
}
