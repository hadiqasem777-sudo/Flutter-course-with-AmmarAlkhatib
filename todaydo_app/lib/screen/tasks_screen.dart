import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:todaydo_app/screen/add_task_screen.dart';
import 'package:todaydo_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TasksList(),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
