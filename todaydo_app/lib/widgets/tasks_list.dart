import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/models/task.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:todaydo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress:() {
                taskData.deleteTask(taskData.tasks[index]);
              },
              child: TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxChanged: (newVal) {
                  taskData.updateTask(taskData.tasks[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
