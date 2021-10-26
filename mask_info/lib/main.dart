import 'package:flutter/material.dart';
import 'package:mask_info/ui/view/main_screen.dart';
import 'package:mask_info/view_model/mask_store_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaskInfo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MaskStoreViewModel(),
        child: const MainScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
