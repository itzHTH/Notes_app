import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hint, this.maxLine = 1});

  final String hint;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(hint),
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
