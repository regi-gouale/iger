import 'package:flutter/material.dart';
import 'package:iger/screens/views/home_view.dart';
import 'package:iger/screens/views/list_tasks_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 30.0,
        ),
        title: const Text(
          "Accueil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
              ),
              label: "Mes listes"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 40.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
