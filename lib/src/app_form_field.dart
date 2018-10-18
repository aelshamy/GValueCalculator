import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;

  AppTextFormField({
    Key key,
    this.labelText,
    this.helperText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a valid value';
          }
        },
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          helperText: helperText,
        ),
      ),
    );
  }
}
