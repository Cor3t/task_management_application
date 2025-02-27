import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/screens/task_edit.dart';
import 'package:taskapp/utils/task_provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskModel taskDetails;

  const TaskDetailScreen({required this.taskDetails, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          !taskDetails.completed
              ? IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TaskEditScreen(taskDetail: taskDetails),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                )
              : Text(""),
          IconButton(
            onPressed: () {
              provider.deleteTask(taskDetails.id!);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskDetails.title,
              style: TextStyle(fontSize: 18),
            ),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(taskDetails.description),
          ],
        ),
      ),
    );
  }
}
