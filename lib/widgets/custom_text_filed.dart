import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      this.maxLine = 1,
      required this.label,
      this.onSaved,
      this.hint, this.onChanged});

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String label;
  final String? hint;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "The Filed Is Required";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          border: textFiledBorder(),
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
