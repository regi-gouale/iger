import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iger/screens/main_screen.dart';
import 'package:iger/services/add_task/add_task_bloc.dart';
import 'package:iger/services/delete_task/delete_task_bloc.dart';
import 'package:iger/services/search_task/search_task_bloc.dart';

Future<void> main() async {
  runApp(const IgerApp());
}

class IgerApp extends StatelessWidget {
  const IgerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AddTaskBloc>(
          create: (context) => AddTaskBloc(),
        ),
        BlocProvider<SearchTaskBloc>(
          create: (context) => SearchTaskBloc(),
        ),
        BlocProvider<DeleteTaskBloc>(
          create: (context) => DeleteTaskBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'iGer',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purpleAccent,
          fontFamily: 'Comfortaa',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          primarySwatch: Colors.green,
        ),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
