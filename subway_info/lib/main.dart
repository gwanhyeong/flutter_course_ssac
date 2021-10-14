import 'package:flutter/material.dart';
import 'package:subway_info/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '실시간 지하철 정보',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
