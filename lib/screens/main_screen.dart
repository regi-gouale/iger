import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iger/components/list_app_bar.dart';
import 'package:iger/screens/views/home_view.dart';
import 'package:iger/screens/views/list_tasks_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController;

  int _currentIndex = 1;
  String _appBarTitle = "Accueil";

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _modal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Text(
                  "Créer",
                  style: GoogleFonts.lato(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.task_rounded),
              title: const Text("Créer une procédure"),
              onTap: () {
                print("Nouvelle procédure");
              },
            ),
            ListTile(
              leading: const Icon(Icons.task_alt_rounded),
              title: const Text("Créer une liste de tâches"),
              onTap: () {
                print("Nouvelle liste de tâches");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ListTile(
                leading: const Icon(Icons.edit_rounded),
                title: const Text("Modifier"),
                onTap: () {
                  print("Modifier");
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ListAppBar(title: _appBarTitle),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _appBarTitle = index == 1 ? "Mes listes" : "Accueil";
          });
        },
        controller: _pageController,
        children: const <Widget>[
          HomeView(),
          ListTasksView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
          _currentIndex = index;
        },
        elevation: 10.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
              ),
              label: "Mes listes"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modal(context);
        },
        child: const Icon(
          Icons.add,
          size: 40.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
