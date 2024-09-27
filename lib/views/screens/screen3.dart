import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                  width: 330,
                  "assets/images/3d-casual-life-cute-astronaut-sitting-with-flag.png")),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Will it Benefit me ?",
            style: TextStyle(fontSize: 28, color: kSecondaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            textAlign: TextAlign.center,
            "This project was programmed for training on the \"Flutter\" framework, so you may find that it is a simple project from the user's perspective, but it helped the developer learn a lot of information and features in application development.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
