import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static String id = "EditView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditViewBody(),
    );
  }
}

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
        ],
      ),
    );
  }
}
