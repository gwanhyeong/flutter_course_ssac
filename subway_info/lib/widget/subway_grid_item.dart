import 'package:flutter/material.dart';
import 'package:subway_info/model/seoul_subway_arrival_data.dart';

class SubwayGridItem extends StatelessWidget {
  final SeoulSubwayArrivalData data;
  const SubwayGridItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 20,
            color: Colors.brown,
            child: Text(
              _getSubwayLineNumber(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            alignment: Alignment.center,
          ),
          const SizedBox(height: 8.0),
          Text(data.trainLineNm),
          Text(data.arvlMsg2),
          const SizedBox(height: 8.0),
          Text('${data.subwayHeading} 문'),
        ],
      ),
    );
  }

  String _getSubwayLineNumber() {
    int lineNumber = int.parse(data.subwayId) - 1000;
    return (lineNumber <= 9) ? '$lineNumber호선' : '기타';
  }
}
