import 'package:flutter/material.dart';
import 'package:search_image/model/pixabay_api_image.dart';

class ImageItem extends StatelessWidget {
  final PixabayApiImage data;
  const ImageItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 160.0,
            height: 90.0,
            child: Image.network(
              data.previewURL!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(data.tags!),
        ],
      ),
    );
  }
}
