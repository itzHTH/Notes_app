import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

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
                "assets/images/3d-casual-life-cute-astronaut-stands-with-flag.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Welcome !",
            style: TextStyle(fontSize: 28, color: kSecondaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Although you are new to the “Astronaut Notes” application, let me introduce you to the idea of ​​the application",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
