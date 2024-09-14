import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_filed.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppbar(
            icon: Icons.check,
            title: "Edit Note",
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFiled(label: "Title"),
          SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            label: "Content",
            maxLine: 5,
          )
        ],
      ),
    );
  }
}
