import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[400],
            ),
          ),
          TextField(
            controller: textFieldController,
            autofocus: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: () {
                if (textFieldController.text.trim().isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false).addTask(textFieldController.text.trim());
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
