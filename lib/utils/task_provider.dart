import 'package:flutter/material.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/utils/db_manager.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  TaskProvider() {
    _loadTask();
  }

  void _loadTask() async {
    tasks = await DBManager.instance.getAllTask();
    notifyListeners();
  }

  void addTask(TaskModel task) async {
    await DBManager.instance.insertTask(task);
    tasks.add(task);
    notifyListeners();
  }
}
