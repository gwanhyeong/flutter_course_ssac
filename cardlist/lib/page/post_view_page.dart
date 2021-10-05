import 'package:cardlist/api.dart' as api;
import 'package:cardlist/model/comment.dart';
import 'package:cardlist/model/post.dart';
import 'package:cardlist/widget/post_card.dart';
import 'package:flutter/material.dart';

class PostViewPage extends StatefulWidget {
  final Post post;

  const PostViewPage({Key? key, required this.post}) : super(key: key);

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  List<Comment> _comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Post',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.title ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const Divider(),
                  Text(widget.post.body ?? ''),
                ],
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Comments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (_comments.isNotEmpty)
            ..._comments.map((comment) {
              return PostCard(
                title: comment.name ?? '',
                body: comment.body ?? '',
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
    api.fetchComments(widget.post.id ?? 0).then((comments) {
      setState(() {
        _comments = comments;
      });
    });
  }
}
