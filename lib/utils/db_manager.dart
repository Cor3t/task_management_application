import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskapp/models/task_model.dart';

class DBManager {
  static final DBManager instance = DBManager._instance();
  static Database? _database;
  final String taskTable = "tasks";

  DBManager._instance();

  Future<Database> get db async {
    _database ??= await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "task.db");

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $taskTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(255) NOT NULL,
            description TEXT,
            completed BOOLEAN,
            dateCreated DATETIME NOT NULL
        )
    ''');
  }

  Future<bool> doesDatabaseExist() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return databaseExists(path);
  }

  Future insertTask(TaskModel task) async {
    Database db = await instance.db;
    return await db.insert(taskTable, task.toMap());
  }

  Future<List<TaskModel>> getAllTask() async {
    Database db = await instance.db;

    final tasks = await db.query(taskTable);
    return tasks.map((task) => TaskModel.fromMap(task)).toList();
  }

  Future<int> updateTask(int id, Map<String, dynamic> updateFields) async {
    Database db = await instance.db;
    return await db.update(
      taskTable,
      updateFields,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
