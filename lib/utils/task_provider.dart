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
    var result = await DBManager.instance.insertTask(task);
    final updatedTask = TaskModel(
      id: result,
      title: task.title,
      description: task.description,
      completed: task.completed,
      dateCreated: task.dateCreated,
    );

    tasks.add(updatedTask);
    notifyListeners();
  }

  void completeTask(int id, bool completed) async {
    await DBManager.instance.updateTask(
      id,
      {"completed": completed ? 1 : 0},
    );
    _loadTask();
    notifyListeners();
  }
}
