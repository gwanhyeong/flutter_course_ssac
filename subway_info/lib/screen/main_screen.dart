import 'package:flutter/material.dart';
import 'package:subway_info/api.dart';
import 'package:subway_info/model/seoul_subway_result.dart';
import 'package:subway_info/widget/subway_grid_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController(text: '서울');
  String _keyword = '서울';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('실시간 지하철 정보'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: '역 이름 '),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      const snackBar = SnackBar(content: Text('역 이름을 입력해주세요.'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    setState(() {
                      _keyword = _controller.text.trim();
                    });

                    FocusScope.of(context).unfocus();
                  },
                  child: const Text('검색'),
                ),
              ],
            ),
          ),
          FutureBuilder<SeoulSubwayResult>(
            future: fetchData(_keyword),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                if (snapshot.data!.status == null) {
                  return GridView.count(
                    childAspectRatio: (1 / .6),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.realtimeArrivalList!
                        .map((data) => SubwayGridItem(data: data))
                        .toList(),
                  );
                } else {
                  return Center(child: Text('API: ${snapshot.data!.message!}'));
                }
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
