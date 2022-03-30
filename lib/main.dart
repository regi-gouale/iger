import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:iger/screens/main_screen.dart';
import 'package:iger/services/add_task/add_task_bloc.dart';
import 'package:iger/services/delete_task/delete_task_bloc.dart';
import 'package:iger/services/task_category/list_task_bloc.dart';
import 'package:iger/services/search/search_bloc.dart';
import 'package:iger/utils/iger_theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(
      await getDatabasesPath(),
      "ider_database.db",
    ),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tasks(id TEXT PRIMARY KEY, title TEXT, type TEXT, items BLOB, dueDate TEXT, status TEXT)",
      );
    },
    version: 1,
  );

  final TaskRepository taskRepository = TaskRepository(
    database: database,
  );

  runApp(IgerApp(
    taskRepository: taskRepository,
    database: database,
  ));
}

class IgerApp extends StatelessWidget {
  final TaskRepository taskRepository;
  final Future<Database> database;
  const IgerApp({
    Key? key,
    required this.taskRepository, required this.database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AddTaskBloc>(
          create: (context) => AddTaskBloc(
            taskRepository: taskRepository,
          ),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(
            taskRepository: taskRepository,
          ),
        ),
        BlocProvider<DeleteTaskBloc>(
          create: (context) => DeleteTaskBloc(
            taskRepository: taskRepository,
          ),
        ),
        BlocProvider<TaskCategoryBloc>(
          create: (context) => TaskCategoryBloc(
            taskRepository: taskRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'iGer',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purpleAccent,
          scaffoldBackgroundColor: IgerTheme.scaffoldColor,
          fontFamily: 'Comfortaa',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          primarySwatch: Colors.purple,
        ),
        home: MainScreen(database: database,),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
