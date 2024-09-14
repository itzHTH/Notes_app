import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppbar(),
        ],
      ),
    );
  }
}
