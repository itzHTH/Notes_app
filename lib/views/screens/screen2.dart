import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
                "assets/images/3d-casual-life-cute-astronaut-walks-around-the-planet.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Astronaut ?",
            style: TextStyle(fontSize: 28, color: kSecondaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            textAlign: TextAlign.center,
            "The character \"Astronaut\" was chosen because of the developer's addiction to his impossible dream of being an astronaut, so he is attached to this character and places it everywhere in his life.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
