import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/utils/task_provider.dart';

class TaskEditScreen extends StatefulWidget {
  final TaskModel taskDetail;

  const TaskEditScreen({required this.taskDetail, super.key});

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  late TextEditingController titleCtrl;

  late TextEditingController desCtrl;

  @override
  void initState() {
    titleCtrl = TextEditingController(text: widget.taskDetail.title);
    desCtrl = TextEditingController(text: widget.taskDetail.description);
    super.initState();
  }

  void updateTask(TaskProvider provider) {
    provider.updateTask(
      widget.taskDetail.id!,
      {
        "title": titleCtrl.text,
        "description": desCtrl.text,
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => updateTask(provider),
            child: Text("Save"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
            ),
            TextField(
              controller: desCtrl,
            ),
          ],
        ),
      ),
    );
  }
}
