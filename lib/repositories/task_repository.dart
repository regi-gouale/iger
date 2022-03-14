import 'dart:async';

import 'package:iger/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  final Future<Database> database;
  int numberOfTasks;

  TaskRepository({
    required this.database,
    this.numberOfTasks = 0,
  }) {
    initialize();
  }

  final StreamController<List<TaskModel>> _taskController =
      StreamController<List<TaskModel>>();

  int get number => numberOfTasks;
  set number(int value) => numberOfTasks = value;

  Stream<List<TaskModel>> get tasks => _taskController.stream;

  Future<void> initialize() async {
    final db = await database;
    final List<Map<String, dynamic>> tasksFromDatabase =
        await db.query("tasks");

    List<TaskModel> tasks = tasksFromDatabase
        .map(
          (e) => TaskModel(
            id: e["id"],
            title: e["title"],
            type: e["type"],
            items: e["items"],
            dueDate: e["dueDate"],
            status: '',
          ),
        )
        .toList();

    _taskController.add(tasks);
  }

  Future<void> addNewTask(Map<String, dynamic> data) async {
    TaskModel.insertTaskToDatabase(
      database: database,
      data: data,
    );

    final tasks = await TaskModel.retrieveTaskFromDatabase(
      database: database,
    );

    List<TaskModel> tasksModel = tasks
        .map((e) => TaskModel(
              id: e["id"],
              title: e["title"],
              type: e["type"],
              items: e["items"],
              dueDate: e["dueDate"],
              status: e["status"],
            ))
        .toList();
    _taskController.add(tasksModel);
  }

  Future<void> removeTask(TaskModel taskModel) async {
    TaskModel.deleteTaskFromDatabase(
      database: database,
      taskModel: taskModel,
    );

    final tasksModel = await TaskModel.retrieveTaskFromDatabase(
      database: database,
    );

    List<TaskModel> tasks = tasksModel
        .map((e) => TaskModel(
              id: e["id"],
              title: e["title"],
              type: e["type"],
              items: e["items"],
              dueDate: e["dueDate"],
              status: e["status"],
            ))
        .toList();
    _taskController.add(tasks);
  }

  Future<List<TaskModel>> filterTask() async {
    List<Map<String, dynamic>> tasksModel =
        await TaskModel.retrieveTaskFromDatabase(
      database: database,
    );
    final tasks = List<Map<String, dynamic>>.from(tasksModel);
    tasks.sort();
    return tasks
        .map((e) => TaskModel(
              id: e["id"],
              title: e["title"],
              type: e["type"],
              items: e["items"],
              dueDate: e["dueDate"],
              status: e["status"],
            ))
        .toList();
  }
}
