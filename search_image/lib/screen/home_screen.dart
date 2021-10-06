import 'package:flutter/material.dart';
import 'package:search_image/api.dart';
import 'package:search_image/model/search_result.dart';
import 'package:search_image/widget/image_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchResult? _searchResult;

  @override
  void initState() {
    super.initState();
    _searchKeyword('iphone');
  }

  void _searchKeyword(String keyword) async {
    fetchSearchResult(keyword).then((SearchResult result) {
      setState(() {
        _searchResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API test'),
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _searchResult != null ? _searchResult!.hits!.length : 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ImageItem(data: _searchResult!.hits![index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 6.0);
          },
        ),
      ),
    );
  }
}
