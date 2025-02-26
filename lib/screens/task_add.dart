import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/utils/notification_manager.dart';
import 'package:taskapp/utils/task_provider.dart';

class TaskAddScreen extends StatelessWidget {
  TaskAddScreen({super.key});

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController desCtrl = TextEditingController();
  final NotificationManager notificationManager = NotificationManager();

  void handleCreateTask(BuildContext context) async {
    await notificationManager.requestPermissions();

    // ignore: use_build_context_synchronously
    var provider = Provider.of<TaskProvider>(context, listen: false);

    int result = await provider.addTask(TaskModel(
      title: titleCtrl.text,
      description: desCtrl.text,
      completed: false,
      dateCreated: DateTime.now().toIso8601String(),
    ));

    notificationManager.scheduleNotification(
      result,
      titleCtrl.text,
      desCtrl.text,
      Duration(minutes: 5),
    );
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 200, left: 16, right: 16, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter new task",
              ),
              controller: titleCtrl,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter task description",
              ),
              controller: desCtrl,
            ),
            Spacer(),
            FilledButton(
              onPressed: () => handleCreateTask(context),
              child: Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
