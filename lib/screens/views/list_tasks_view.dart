import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, dynamic>> tasksList = [
  {
    "title": "Liste de tâches 1",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "dueDate": "20/03/2022",
  },
  {
    "title": "Liste de tâches 2",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "dueDate": "20/03/2022",
  },
  {
    "title": "Liste de tâches 3",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "dueDate": "20/03/2022",
  }
];

class ListTasksView extends StatelessWidget {
  const ListTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasksList.isEmpty
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
                      text: "Vous n'avez pas de listes.",
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
                          "Les listes enregistrées dans 'Mes listes' doivent apparaître ici",
                      style: GoogleFonts.lato(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.task_alt_rounded),
                title: Text(
                  tasksList[index]["title"],
                  style: GoogleFonts.lato(),
                ),
                onTap: () {
                  print(tasksList[index]["title"]);
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

                                  // Navigator.pop(context);
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
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
                                            labelStyle: GoogleFonts.lato(),
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
                                          tasksList[index]["title"] =
                                              _taskController.text;
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
                              onTap: () {},
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
            itemCount: tasksList.length,
          );
  }
}
