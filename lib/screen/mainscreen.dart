import 'package:flutter/material.dart';
import 'package:to_do_list/screen/completed.dart';
import 'package:to_do_list/screen/uncompleted.dart';
import 'to_do_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: ToDoListScreen(),
          ),
          Container(
            child: CompletedScreen(),
          ),
          Container(
            child: UnCompletedScreen(),
          )
        ],
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
