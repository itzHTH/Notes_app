import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditView.id);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xfffecd7e)),
        child: Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Text(
                  "Flutter Tips",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Get Best App With Huthaifa OR leader , Please Subscribe And like",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black.withOpacity(.7)),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 28,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Text(
                  "May 21, 2005",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(.7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
