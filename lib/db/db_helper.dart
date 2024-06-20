import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminder/ui_export.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const dbName = 'reminder.db';
  static const dbVersion = 1;
  static const tableName = 'reminder_table';

  Database? _db;

  static final DbHelper instance = DbHelper.init();
  DbHelper.init();

  Future init() async {
    final docDir = await getApplicationDocumentsDirectory();
    final path = join(docDir.path, dbName);
    _db = await openDatabase(path,
      version: dbVersion,
      onCreate: _onCreate
    );
  }

  Future<Database> get database async {
    if (_db != null) return _db!;

    await init();
    return _db!;
  }

  /// private func create new table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        ${ReminderModel.columnReminderTime} TEXT NOT NULL,
        ${ReminderModel.columnCreatedAt} TEXT,
        ${ReminderModel.columnUpdatedAt} TEXT
      )
    ''');
  }

  /// func add new value
  Future<int> add(Map<String, dynamic> row) async {
    try {
      return await database.then((db) {
        return db.insert(tableName, row..remove('id'));
      });
    } catch (err, stackTrace) {
      throw Exception('Fail add: $row\n Err: $err\n Stacktrace: $stackTrace');
    }
  }

  /// func update new value based on [columnId]
  Future<int> update(Map<String, dynamic> row) async {
    final id = row['id'];
    try {
      return await database.then((db) => db.update(tableName, row,
          where: 'id=?',
          whereArgs: [id]
      ));
    } catch (err, stackTrace) {
      throw Exception('Fail to update: $row\n Err: $err\n Stacktrace: $stackTrace');
    }
  }

  /// func delete value based on [id]
  Future<int> delete(String id) async {
    try {
      return await database.then((value) => value.delete(tableName,
          where: 'id=?',
          whereArgs: [id]
      ));
    } catch (err, stackTrace) {
      throw Exception('Fail to delete: $id\n Err: $err\n Stacktrace: $stackTrace');
    }
  }

  /// func get all value from [tableName] as List
  Future<List<Map<String, dynamic>>> get({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      return await database.then((value) => value.query(tableName,
        where: where,
        whereArgs: whereArgs,
      ));
    } catch (err, stackTrace) {
      throw Exception('Fail to get where: $where ${whereArgs == null ? '' : 'and whereArgs: $whereArgs'}\n Err: $err\n Stacktrace: $stackTrace');
    }
  }
}