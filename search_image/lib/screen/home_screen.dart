import 'package:flutter/material.dart';
import 'package:search_image/api.dart';
import 'package:search_image/model/search_result.dart';

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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _searchResult != null ? _searchResult!.hits!.length : 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final resultItem = _searchResult!.hits![index];
            return SizedBox(
              width: 100.0,
              height: 100.0,
              child: FittedBox(
                child: Image.network(resultItem.previewURL!),
              ),
            );
          },
        ),
      ),
    );
  }
}
