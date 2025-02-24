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
            id INTEGER AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(255) NOT NULL,
            description TEXT,
            date_created DATETIME NOT NULL
        )
    ''');
  }

  Future insertTask(TaskModel task) async {
    Database db = await instance.db;
    return await db.insert(taskTable, task.toMap());
  }

  Future<List<Map>> getAllTask() async {
    Database db = await instance.db;
    return await db.query(taskTable);
  }
}
