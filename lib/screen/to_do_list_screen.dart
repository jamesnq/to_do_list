import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/to_do_item.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  String input = "";

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
                  title: const Text("Add Todo List"),
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
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            TodoItem todo = TodoItem(name: input);
                            todos.add(todo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add")),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemExtent: 70,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: Key(todos[index].name),
              startActionPane: ActionPane(
                extentRatio: 1 / 6,
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      setState(() {
                        todos[index].isConfirmed = !todos[index].isConfirmed;
                      });
                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.check,
                  )
                ],
              ),
              endActionPane: ActionPane(
                extentRatio: 1 / 6,
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      setState(() {
                        todos.removeAt(index);
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
                color: todos[index].isConfirmed ? Colors.green : Colors.white,
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: ListTile(
                  title: Text(todos[index].name),
                ),
              ),
            );
          }),
    );
  }
}
