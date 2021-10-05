import 'package:conference_app/screen/conference_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conference App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConferenceListScreen(),
    );
  }
}
