import 'package:conference_app/api.dart';
import 'package:conference_app/model/conference.dart';
import 'package:conference_app/screen/conference_detail_screen.dart';
import 'package:conference_app/widget/conference_item.dart';
import 'package:flutter/material.dart';

class ConferenceListScreen extends StatelessWidget {
  const ConferenceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferences'),
      ),
      body: FutureBuilder<List<Conference>>(
        future: fetchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error!.toString()));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('no data'));
          }

          List<Conference> list = snapshot.data ?? [];
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              Conference data = list[index];
              return ConferenceItem(
                title: data.name,
                body: data.location,
                onTap: () {
                  openDetailScreen(context, data);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        },
      ),
    );
  }

  void openDetailScreen(BuildContext context, Conference conference) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ConferenceDetailScreen(data: conference)),
    );
  }
}
