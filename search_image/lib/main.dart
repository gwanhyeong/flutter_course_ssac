import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_image/pixabay_api_view_model.dart';
import 'package:search_image/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<PixabayApiViewModel>(
        create: (_) => PixabayApiViewModel(),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
