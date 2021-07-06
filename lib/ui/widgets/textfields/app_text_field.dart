import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;

  AppTextFieldWidget({this.inputController, this.onChanged, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        controller: inputController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        keyboardType: textInputType,
        onChanged: onChanged,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
