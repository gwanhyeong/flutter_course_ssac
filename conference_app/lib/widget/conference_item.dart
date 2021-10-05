import 'package:conference_app/model/conference.dart';
import 'package:flutter/material.dart';

class ConferenceItem extends StatelessWidget {
  final Conference data;
  final void Function()? onTap;
  const ConferenceItem({Key? key, required this.data, this.onTap})
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
              data.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(data.location ?? ''),
          ],
        ),
      ),
    );
  }
}
