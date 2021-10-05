import 'package:conference_app/model/conference.dart';
import 'package:flutter/material.dart';

class ConferenceItem extends StatelessWidget {
  final String? title;
  final String? body;
  final void Function()? onTap;
  const ConferenceItem({Key? key, this.title, this.body, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(body ?? ''),
          ],
        ),
      ),
    );
  }
}
