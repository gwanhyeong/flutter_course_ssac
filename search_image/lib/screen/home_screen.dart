import 'package:flutter/material.dart';
import 'package:search_image/api_inherited_widget.dart';
import 'package:search_image/model/pixabay_api_result.dart';
import 'package:search_image/widget/image_item.dart';
import 'package:search_image/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controller;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      ApiInheritedWidget.of(context).dataModel.fetch('iphone');
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API test'),
      ),
      body: ListView(
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
                  const snackBar = SnackBar(
                    content: Text('검색할 키워드를 입력해주세요.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                ApiInheritedWidget.of(context)
                    .dataModel
                    .fetch(_controller.text);
              },
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<PixabayApiResult>(
            stream: ApiInheritedWidget.of(context).dataModel.apiStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final hits = snapshot.data!.hits!;
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: hits.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ImageItem(data: hits[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 6.0);
                  },
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
