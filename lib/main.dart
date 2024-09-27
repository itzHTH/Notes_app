import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cache/shared.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/edit_view.dart';
import 'package:notes_app/views/home_view.dart';
import 'package:notes_app/views/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.intiShared();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  NotesApp({super.key});

  final bool isOld = SharedPref.getBool(key: "isOld") ?? false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light, fontFamily: "Poppins"),
        routes: {
          HomeView.id: (contxet) => const HomeView(),
          EditView.id: (context) => const EditView(),
          OnboardingView.id: (context) => const OnboardingView(),
        },
        initialRoute:isOld ? HomeView.id : OnboardingView.id,
      ),
    );
  }
}
