import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
