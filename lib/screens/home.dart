import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/utils/db_manager.dart';
import 'package:taskapp/utils/task_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBManager db = DBManager.instance;

  Future getTasks() async {
    final tasks = await db.getAllTask();

    print(tasks);
  }

  @override
  void initState() {
    getTasks();
    super.initState();
  }

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
                // provider.tasks.map(toElement)
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
