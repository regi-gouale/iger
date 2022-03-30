import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iger/models/task_model.dart';
import 'package:iger/services/delete_task/delete_task_bloc.dart';
import 'package:iger/services/task_category/list_task_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ListTasksView extends StatelessWidget {
  final Future<Database> database;
  const ListTasksView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteTaskBloc, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccessState) {
          print("delete");
        }
      },
      child: BlocConsumer<TaskCategoryBloc, TaskCategoryState>(
        listener: (context, state) {},
        builder: ((context, state) {
          List<TaskModel> tasksModel = [];

          if (state is TaskCategoryInitialState) {
            tasksModel = state.taskModel;
          }
          return tasksModel.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.beach_access_rounded,
                        size: 100,
                      ),
                      Text.rich(
                        TextSpan(
                            text: "Vous n'avez pas de tâches.",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                              text:
                                  "Les tâches enregistrées dans ",
                              style: GoogleFonts.lato(),
                              children: [
                                TextSpan(
                                  text: "Mes listes",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: " doivent apparaître ici",
                                  style: GoogleFonts.lato(),
                                ),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: tasksModel.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.task_alt_rounded),
                      title: Text(
                        tasksModel[index].title,
                        style: GoogleFonts.lato(),
                      ),
                      onTap: () {
                        print(tasksModel[index].title);
                      },
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      "Option de la tâche",
                                      style: GoogleFonts.lato(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(
                                      Icons.drive_file_rename_outline_rounded),
                                  title: Text(
                                    "Rennomer la tâche",
                                    style: GoogleFonts.lato(),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController _taskController =
                                            TextEditingController();

                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          title: Center(
                                            child: Text(
                                              "Rennomer",
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                          content: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Form(
                                              child: TextFormField(
                                                controller: _taskController,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      GoogleFonts.lato(),
                                                  labelText: "Nouveau nom",
                                                  icon: const Icon(
                                                    Icons
                                                        .drive_file_rename_outline_rounded,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Annuler",
                                                style: GoogleFonts.lato(),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                print(_taskController.text);

                                                // tasksModel[index].title =
                                                //     _taskController.text;
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Modifier",
                                                style: GoogleFonts.lato(),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.edit_note_rounded),
                                  title: Text(
                                    "Modifier",
                                    style: GoogleFonts.lato(),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.filter_list),
                                  title: Text(
                                    "Trier",
                                    style: GoogleFonts.lato(),
                                  ),
                                  onTap: () {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.red,
                                    ),
                                    title: Text(
                                      "Supprimer",
                                      style: GoogleFonts.lato(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onTap: () {
                                      context.read<DeleteTaskBloc>().add(
                                            OnDeleteTaskEvent(
                                              taskModel: tasksModel[index],
                                            ),
                                          );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        );
                      },
                    );
                  },
                );
        }),
      ),
    );
  }
}
