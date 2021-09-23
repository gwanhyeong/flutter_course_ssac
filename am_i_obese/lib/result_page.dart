import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double height;
  final double weight;

  const ResultPage({Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmi = _getBmi();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('비만도 계산기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getBmiText(bmi),
              style: const TextStyle(fontSize: 30),
            ),
            _buildBmiIcon(bmi),
            const SizedBox(height: 16),
            Text('입력된 키: ${height.toString()}cm / 몸무게: ${weight.toString()}kg'),
          ],
        ),
      ),
    );
  }

  double _getBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String _getBmiText(double bmi) {
    String result = '저체중';

    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상 체중';
    }

    return result;
  }

  Icon _buildBmiIcon(double bmi) {
    IconData icon = Icons.sentiment_dissatisfied;
    Color color = Colors.orange;

    if (bmi >= 23) {
      icon = Icons.sentiment_very_dissatisfied;
      color = Colors.red;
    } else if (bmi >= 18.5) {
      icon = Icons.sentiment_satisfied_outlined;
      color = Colors.green;
    }

    return Icon(icon, color: color, size: 90);
  }
}
