import 'package:flutter/material.dart';
import 'package:iger/screens/main_screen.dart';

Future<void> main() async {
  runApp(const IgerApp());
}

class IgerApp extends StatelessWidget {
  const IgerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
