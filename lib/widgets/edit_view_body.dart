import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helper/show_success_toast.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_filed.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppbar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchNote();
              showSuccessToast(context);
              Navigator.pop(context);
            },
            icon: Icons.check,
            title: "Edit Note",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFiled(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
            label: "Title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            onChanged: (value) {
              subtitle = value;
            },
            hint: widget.note.subtitle,
            label: "Content",
            maxLine: 5,
          ),
          const SizedBox(
            height: 15,
          ),
          ListColorItemView(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

class ListColorItemView extends StatefulWidget {
  const ListColorItemView({super.key, required this.note});
  final NoteModel note;
  @override
  State<ListColorItemView> createState() => _ListColorItemViewState();
}

class _ListColorItemViewState extends State<ListColorItemView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kColors[currentIndex].value;
                    setState(() {});
                  },
                  child: ColorItem(
                      isActive: currentIndex == index, color: kColors[index]),
                ),
              )),
    );
  }
}
