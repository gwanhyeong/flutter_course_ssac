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
          FutureBuilder<Todo>(
            future: fetch(),
            builder: (context, AsyncSnapshot<Todo> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Error!');
              } else if (!snapshot.hasData) {
                return const Text('No data');
              }

              Todo? todo = snapshot.data;
              return Text(todo?.title ?? '');
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Fetch list'),
          ),
          FutureBuilder<List<Todo>>(
            future: fetchList(),
            builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Error!');
              } else if (!snapshot.hasData) {
                return const Text('No data');
              }

              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:
                    snapshot.data!.map((todo) => Text(todo.title)).toList(),
              );
            },
          ),
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
