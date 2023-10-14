import 'package:assignment_10/add_task.dart';
import 'package:assignment_10/edit_item.dart';

import 'package:assignment_10/todomodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          )
        ],
        elevation: 1,
      ),
      body: SizedBox(
        child: Column(
          children: [
            AddTaskModel(onAddTap: (Todo task) {
              addTodo(task);
            }),
            Expanded(
                child: ListView.separated(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                final Todo todo = todoList[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: ListTile(
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          title: const Text(
                            'Alert',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          content: const SizedBox(
                            height: 10,
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return EditItem(
                                            todoitem: todo,
                                            addUpdate: (Todo todoupdate) {
                                              updateItem(todoupdate, todo);
                                            },
                                          );
                                        });
                                  },
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    delteItem(index);
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    title: Text(todoList[index].title),
                    subtitle: Text(todoList[index].description),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: Colors.black38,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 10,
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  addTodo(Todo task) {
    todoList.add(task);
    setState(() {});
  }

  updateItem(Todo uptodo, Todo todo) {
    todo.title = uptodo.title;
    todo.description = uptodo.description;
    setState(() {});
  }

  delteItem(int index) {
    todoList.removeAt(index);
    setState(() {});
  }
}
