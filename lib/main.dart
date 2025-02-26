import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/screens/home.dart';
import 'package:taskapp/screens/task_add.dart';
import 'package:taskapp/utils/db_manager.dart';
import 'package:taskapp/utils/notification_manager.dart';
import 'package:taskapp/utils/task_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBManager.instance.initDB();
  await NotificationManager().initialize();
  runApp(
    ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
