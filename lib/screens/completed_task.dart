import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/components/task_tile.dart';
import 'package:taskapp/models/task_model.dart';
import 'package:taskapp/screens/task_detail.dart';
import 'package:taskapp/utils/task_provider.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed tasks"),
      ),
      body: Consumer<TaskProvider>(builder: (context, provider, _) {
        List<TaskModel> alltasks =
            provider.tasks.where((data) => data.completed == true).toList();
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
                        onChanged: (value) {},
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
                      ),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
