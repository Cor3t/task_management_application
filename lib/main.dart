import 'package:flutter/material.dart';
import 'package:taskapp/screens/home.dart';
import 'package:taskapp/utils/db_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBManager.instance.initDB();
  runApp(const MyApp());
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
