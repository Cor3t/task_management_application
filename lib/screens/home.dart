import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/components/task_tile.dart';
import 'package:taskapp/screens/task_add.dart';
import 'package:taskapp/utils/db_manager.dart';
import 'package:taskapp/utils/task_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DBManager db = DBManager.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<TaskProvider>(builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('All your tasks'),
                ...provider.tasks.map(
                  (data) => TaskTileWidget(
                    value: data.completed,
                    title: data.title,
                  ),
                )
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
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
