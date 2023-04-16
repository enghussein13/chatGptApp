import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_ai/shared/cubit/bloc_observer.dart';
import 'package:mo_ai/shared/cubit/chat_gpt_cubit.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChatGptCubit()..getModels(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF343541),
            appBarTheme: const AppBarTheme(color: Color(0xFF444654))),
        home: HomeScreen(),
      ),
    );
  }
}
