import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final void Function()? onTap;

  const PostCard(
      {Key? key, required this.title, required this.body, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 3.0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
