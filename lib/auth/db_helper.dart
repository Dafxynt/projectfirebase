import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'attendance.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE attendance(id INTEGER PRIMARY KEY AUTOINCREMENT, action TEXT, time TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertAttendance(String action) async {
    final db = await database;
    await db.insert(
      'attendance',
      {'action': action, 'time': DateTime.now().toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Attendance inserted: $action at ${DateTime.now()}');  // Log data yang disimpan
  }

  Future<List<Map<String, dynamic>>> getAttendanceHistory() async {
    final db = await database;
    final result = await db.query('attendance', orderBy: 'id DESC');
    print('Attendance history: $result');  // Log data yang diambil
    return result;
  }
}
