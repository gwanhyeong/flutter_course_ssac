import 'package:intl/intl.dart';
import 'package:conference_app/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.location ?? ''),
            const SizedBox(height: 16),
            Text(_getDateRange()),
            if (data.link != null)
              TextButton(
                onPressed: _launchUrl,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Go to official website',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getDateRange() {
    DateFormat dateFormat = DateFormat('yMMMd');
    String startDate = dateFormat.format(DateTime.parse(data.start!));
    String endDate = dateFormat.format(DateTime.parse(data.end!));

    return (startDate != endDate) ? '$startDate ~ $endDate' : startDate;
  }

  void _launchUrl() async {
    if (data.link == null) return;

    await canLaunch(data.link!)
        ? await launch(data.link!)
        : throw Exception('Could not launch ${data.link}');
  }
}
