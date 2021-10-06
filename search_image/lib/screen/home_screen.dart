import 'package:flutter/material.dart';
import 'package:search_image/api.dart';
import 'package:search_image/model/search_result.dart';
import 'package:search_image/widget/image_item.dart';
import 'package:search_image/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchResult? _searchResult;
  late TextEditingController _controller;
  late SnackBar _snackBar;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _snackBar = const SnackBar(
      content: Text('검색할 키워드를 입력해주세요.'),
    );
    _searchKeyword('iphone');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API test'),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: SearchBar(
                controller: _controller,
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                    return;
                  }

                  _searchKeyword(_controller.text);
                },
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount:
                  _searchResult != null ? _searchResult!.hits!.length : 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ImageItem(data: _searchResult!.hits![index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 6.0);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _searchKeyword(String keyword) async {
    fetchSearchResult(keyword).then((SearchResult result) {
      setState(() {
        _searchResult = result;
      });
    });
  }
}
