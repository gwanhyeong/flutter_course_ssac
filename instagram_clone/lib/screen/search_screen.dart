import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/create_post_screen.dart';

class SearchScreen extends StatefulWidget {
  final User? user;
  const SearchScreen({Key? key, this.user}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatePostScreen(user: widget.user)),
          );
        },
        child: const Icon(Icons.create),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildListItem(context, index);
      },
    );
  }

  _buildListItem(BuildContext context, int index) {
    return Image.network(
      '',
      fit: BoxFit.cover,
    );
  }
}
