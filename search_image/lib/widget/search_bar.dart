import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;
  const SearchBar({Key? key, required this.controller, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('검색'),
        ),
      ],
    );
  }
}
