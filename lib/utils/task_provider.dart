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

  Future<int> addTask(TaskModel task) async {
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
    return result;
  }

  void deleteTask(int id) async {
    await DBManager.instance.deleteTask(id);
    _loadTask();
    notifyListeners();
  }

  void updateTask(int id, Map<String, dynamic> data) async {
    await DBManager.instance.updateTask(
      id,
      data,
    );
    _loadTask();
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
