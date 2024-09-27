import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.03),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
        iconSize: 28,
      )),
    );
  }
}
