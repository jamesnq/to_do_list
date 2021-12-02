import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  var todo = [];
  String input = "";
  var pressedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Todo List"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            todo.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add")),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemExtent: 70,
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
                key: Key(todo[index]),
                startActionPane: ActionPane(
                  extentRatio: 1/6,
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {
                        setState(() {
                          pressedIndex = index;
                        });
                      },
                      backgroundColor: Color(0xFF00FF00),
                      foregroundColor: Colors.white,
                      icon: Icons.check,
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  extentRatio: 1/6,
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {
                        setState(() {
                          todo.removeAt(index);
                        });
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    )
                  ],
                ),
                  //Item
                  child: Container(
                    color: pressedIndex == index ? Colors.green : Colors.white,
                    child: ListTile(
                      title: Text(todo[index]),

                    ),
                  ),
                );
          }),
    );
  }
}
