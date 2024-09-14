import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/widgets/custom_text_filed.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFiled(
              label: "Title",
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFiled(
              label: "Content",
              maxLine: 5,
            ),
            SizedBox(
              height: 45,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
          child: Text(
        "Add",
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
