import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_filed.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(28),
      child: const Column(
        children: [
          CustomTextFiled(
            hint: "Title",
          ),
        ],
      ),
    );
  }
}
