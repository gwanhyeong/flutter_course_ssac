import 'package:flutter/material.dart';

import 'package:cardlist/api.dart';
import 'package:cardlist/model/post.dart';
import 'package:cardlist/widget/post_card.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView(
        children: [
          if (_posts.isNotEmpty)
            ..._posts.map((post) {
              return PostCard(
                title: post.title ?? '',
                body: post.body ?? '',
                onTap: () {},
              );
            }).toList()
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    fetchPosts().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }
}
