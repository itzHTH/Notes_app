import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

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
                  "assets/images/3d-casual-life-cute-astronaut-with-book-flies-in-outer-space.png")),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Shall We Start?",
            style: TextStyle(fontSize: 28, color: kSecondaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Let us begin our journey and write some notes.",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          // const SizedBox(
          //   height: 5,
          // ),
          Text(
            textAlign: TextAlign.center,
            "Message from the developer: \"I do not want to impress you with this project, I just want your beautiful words and comments about the application, which I will receive on my Telegram account “@ITzHTH”, and thank you for trying my project .\"",
            style:
                TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
