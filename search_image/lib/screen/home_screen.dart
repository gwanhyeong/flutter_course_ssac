import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_image/model/pixabay_api_result.dart';
import 'package:search_image/pixabay_api_view_model.dart';
import 'package:search_image/widget/image_item.dart';
import 'package:search_image/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    Future.microtask(() {
      context.read<PixabayApiViewModel>().fetch('iphone');
    });
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

                context.read<PixabayApiViewModel>().fetch(_controller.text);
              },
            ),
          ),
          const SizedBox(height: 16),
          Selector<PixabayApiViewModel, PixabayApiResult?>(
            selector: (_, model) => model.result,
            builder: _buildImages,
          ),
        ],
      ),
    );
  }

  Widget _buildImages(
    BuildContext context,
    PixabayApiResult? result,
    Widget? child,
  ) {
    if (result != null && result.hits != null) {
      final hits = result.hits!;
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
  }
}
