import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Fetch'),
          ),
        ],
      ),
    );
  }
}
