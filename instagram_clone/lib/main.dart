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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
