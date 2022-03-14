import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Map<String, dynamic>> tasksList = [
  {
    "title": "Premières tâches",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "due-date": "20/03/2022",
  },
  {
    "title": "Deuxièmes tâches",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "due-date": "20/03/2022",
  },
  {
    "title": "Troisièmes tâches",
    "type": "task",
    "items": [
      "Manger",
      "Travailler",
    ],
    "due-date": "20/03/2022",
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
                      style: GoogleFonts.comfortaa(
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
                      style: GoogleFonts.comfortaa(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(
                  index.toString(),
                ),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${tasksList[index]['title']} supprimé",
                        style: GoogleFonts.comfortaa(),
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red.shade200,
                ),
                child: Card(
                  // margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      tasksList[index]["title"],
                      style: GoogleFonts.comfortaa(),
                    ),
                  ),
                ),
              );
            },
            itemCount: tasksList.length,
          );
  }
}
