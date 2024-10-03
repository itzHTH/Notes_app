import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_list_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNote();
    super.initState();
  }

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
            onPressed: () {},
            icon: Icons.search,
            title: "Notes",
          ),
          BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
            return BlocProvider.of<NotesCubit>(context).notesList!.isEmpty
                ? TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 0.0, end: 50.0),
                    builder: (context, value, child) => Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: value,
                      width: value * 8,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You Don't Have Any Note ! , add Now ",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            FontAwesomeIcons.circleExclamation,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox();
          }),
          const Expanded(child: NotesListBuilder()),
        ],
      ),
    );
  }
}
