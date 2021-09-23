import 'package:am_i_obese/result_page.dart';
import 'package:am_i_obese/widget/text_number_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '비만도 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  String? numberValidator(String? value) {
    return (value!.isEmpty || double.tryParse(value) == null)
        ? '숫자를 입력해주세요.'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextNumberField(
                validator: numberValidator,
                controller: _heightController,
                labelText: '키 (cm)',
              ),
              const SizedBox(height: 16),
              TextNumberField(
                validator: numberValidator,
                controller: _weightController,
                labelText: '몸무게 (kg)',
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              height:
                                  double.parse(_heightController.value.text),
                              weight:
                                  double.parse(_weightController.value.text),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('결과 확인'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
