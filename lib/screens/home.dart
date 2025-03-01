import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/components/task_tile.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/screens/completed_task.dart';
import 'package:taskapp/screens/task_add.dart';
import 'package:taskapp/screens/task_detail.dart';
import 'package:taskapp/utils/db_manager.dart';
import 'package:taskapp/utils/task_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DBManager db = DBManager.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All your tasks'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletedTaskScreen(),
                ),
              );
            },
            child: Text("completed task"),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(builder: (context, provider, _) {
        List<TaskModel> alltasks =
            provider.tasks.where((data) => data.completed == false).toList();

        return Container(
          padding: EdgeInsets.all(16),
          child: alltasks.isEmpty
              ? Text("No task")
              : Column(
                  children: [
                    ...alltasks.map(
                      (data) => TaskTileWidget(
                        value: data.completed,
                        title: data.title,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetailScreen(
                                taskDetails: data,
                              ),
                            ),
                          );
                        },
                        onChanged: (value) {
                          provider.completeTask(data.id!, value!);
                        },
                      ),
                    )
                  ],
                ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskAddScreen(),
            ),
          );
        },
      ),
    );
  }
}
