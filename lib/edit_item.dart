import 'package:assignment_10/style.dart';
import 'package:assignment_10/todomodel.dart';
import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({
    super.key,
    required this.todoitem,
    required this.addUpdate,
  });
  final Todo todoitem;
  final Function(Todo) addUpdate;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late TextEditingController _textEditingController;
  late TextEditingController _descriptionEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.todoitem.title);
    _descriptionEditingController =
        TextEditingController(text: widget.todoitem.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: applyTextFieldDecoration(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionEditingController,
              decoration: applyTextFieldDecoration(),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.pop(context);
                Todo todo = Todo(
                  title: _textEditingController.text.trim(),
                  description: _descriptionEditingController.text.trim(),
                );
                widget.addUpdate(todo);
              },
              child: const Text(
                'Edit done',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
