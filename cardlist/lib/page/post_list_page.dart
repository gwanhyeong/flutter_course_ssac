import 'package:cardlist/api.dart' as api;
import 'package:cardlist/model/post.dart';
import 'package:cardlist/page/post_view_page.dart';
import 'package:cardlist/widget/post_card.dart';
import 'package:flutter/material.dart';

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
                onTap: () {
                  openDetailPage(post);
                },
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

  void openDetailPage(Post post) {
    if (post.id == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostViewPage(
          post: post,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    api.fetchPosts().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }
}
