import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

class TaskModel {
  final String id;
  final String title;
  final String type;
  final List<String> items;
  final DateTime dueDate;
  final String status;

  TaskModel( {
    required this.id,
    required this.title,
    required this.type,
    required this.items,
    required this.dueDate,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tilte": title,
      "type": type,
      "items": items,
      "dueDate": dueDate.toString(),
    };
  }

  static Future<void> insertTaskToDatabase({
    required Future<Database> database,
    required Map<String, dynamic> data,
  }) async {
    final db = await database;
    String concat =
        "${data['title']} ${data['type']} ${data['dueDate'].toString()}";
    String _id = sha256.convert(utf8.encode(concat)).toString();

    final TaskModel tasksModel = TaskModel(
      id: _id,
      title: data["title"],
      items: data["items"],
      type: data["type"],
      dueDate: data["dueDate"], 
      status: data["status"],
    );

    await db.insert(
      "tasks",
      tasksModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteTaskFromDatabase({
    required Future<Database> database,
    required TaskModel taskModel,
  }) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: "id = ?",
      whereArgs: [taskModel.id],
    );
  }

  static Future<List<Map<String, dynamic>>> retrieveTaskFromDatabase({
    required Future<Database> database,
  }) async {
    final db = await database;
    return await db.query("tasks");
  }
}
