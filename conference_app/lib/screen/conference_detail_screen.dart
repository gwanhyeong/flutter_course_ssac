import 'package:conference_app/model/conference.dart';
import 'package:flutter/material.dart';

class ConferenceDetailScreen extends StatelessWidget {
  final Conference data;
  const ConferenceDetailScreen({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name ?? ''),
      ),
      body: Container(),
    );
  }
}
