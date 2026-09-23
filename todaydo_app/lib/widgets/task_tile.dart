import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxChanged,
  });
  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkboxChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxChanged,
      ),
    );
  }
}
