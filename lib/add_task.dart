import 'package:assignment_10/style.dart';
import 'package:assignment_10/todomodel.dart';
import 'package:flutter/material.dart';

class AddTaskModel extends StatefulWidget {
  const AddTaskModel({
    super.key,
    required this.onAddTap,
  });

  final Function(Todo) onAddTap;

  @override
  State<AddTaskModel> createState() => _AddTaskModelState();
}

class _AddTaskModelState extends State<AddTaskModel> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleEditingController,
                decoration: applyTextFieldDecoration(text: 'Add Title'),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionEditingController,
                decoration: applyTextFieldDecoration(text: 'Add description'),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    Todo todo = Todo(
                      title: _titleEditingController.text.trim(),
                      description: _descriptionEditingController.text.trim(),
                    );

                    widget.onAddTap(todo);
                    _titleEditingController.clear();
                    _descriptionEditingController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
