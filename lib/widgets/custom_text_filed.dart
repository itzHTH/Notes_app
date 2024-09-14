import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, this.maxLine = 1, required this.label});

  final String label;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          label: Text(label),
          focusedBorder: textFiledBorder(),
          enabledBorder: textFiledBorder(),
        ));
  }

  OutlineInputBorder textFiledBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kPrimaryColor));
  }
}
