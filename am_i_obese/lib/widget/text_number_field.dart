import 'package:flutter/material.dart';

class TextNumberField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? labelText;

  const TextNumberField(
      {Key? key, this.validator, this.controller, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
