import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
