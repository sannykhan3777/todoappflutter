import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoappflutter/models/task_model.dart';

class DatabaseHelper {
  static final _databaseName = "Tasks.db";
  static final _databaseVersion = 1;
  static final table = "tasktable";
  static final idColumn = "id";
  static final nameColumn = "name";
  static final descriptionColumn = "description";
  static final dateColumn = "date";
  static final timeColumn = "time";
  static final togglebtnColumn = "togglebtn";
  static final priorityColumn = "priority";
  static final categoryColumn = "category";

//PRIVATE CONSTRUCTOR
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//SINGLETON CLASS
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    // lazily instantiate the db the first time it is accessed
    else {
      _database = await _initDatabase();
      return _database;
    }
    return _database!;
  }

//INITIALIZE DB
  Future<Database> _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, DatabaseHelper._databaseName);
    return await openDatabase(path,
        version: DatabaseHelper._databaseVersion, onCreate: _createDb);
  }

//CREATE DB
  Future _createDb(Database db, int version) async {
    await db.execute('''CREATE TABLE $table (
        $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
        $nameColumn TEXT NOT NULL,
        $descriptionColumn TEXT NULL,
        $dateColumn TEXT NOT NULL,
        $timeColumn TEXT NOT NULL,
        $togglebtnColumn INT NOT NULL,
        $priorityColumn TEXT NULL,
        $categoryColumn TEXT NULL
    )''');
  }

  Future<Task?> insertDb(Task task) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    final db = await instance.database;
    final id = await db!.insert(table, task.toJson());
    // print(id);

    // final data = await db.query(table);
    // print(data);
    // row to insert
    // Map<String, dynamic> row = {
    //   DatabaseHelper.nameColumn: name,
    //   DatabaseHelper.ageColumn: age
    // };

    // do the insert and get the id of the inserted row
    // int? id = await db?.insert(DatabaseHelper.table, row);
    // // String? name = await db?.insert(DatabaseHelper.table, row);
    // print(name.toString() + "  " + age.toString());
    // // print()

    // show the results: print all rows in the db
    // print(await db!.query(DatabaseHelper.table));
  }

  // A method that retrieves all the dogs from the dogs table.
  // Future<Person?> retrieveDb(int id) async {
  //   final db = await instance.database;
  //   List<Map<String,dynamic>> maps = await db!.query(table,
  //       columns: [idColumn, nameColumn, ageColumn],
  //       where: '$idColumn = ?',
  //       whereArgs: [id]);
  //   if (maps.length > 0) {
  //     return Person.fromJson(maps.first);
  //   }
  //   return null;
  // }

  Future<List<Task>> retrieveAllDb() async {
    final db = await instance.database;
    final result = await db!.query(table, orderBy: DatabaseHelper.idColumn);
    var data = result.map((json) => Task.fromJson(json)).toList();
    // print(result);
    // print(data.length);
    return Future.value(data);
  }
  //
  // Future<void> updateDb(Person person) async {
  //   // Get a reference to the database.
  //   final db = await instance.database;
  //
  //   // Update the given Dog.
  //   final result = await db!.update(
  //     table,
  //     person.toJson(),
  //     // Ensure that the Dog has a matching id.
  //     where: 'id = ?',
  //     // Pass the Dog's id as a whereArg to prevent SQL injection.
  //     whereArgs: [person.id],
  //   );
  //   return result;
  // }

  Future<int> updateDb(Task person) async {
    final db = await instance.database;
    final res =  await db!.update(table, person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
    print(res);
    return res;
  }

  Future<Task?> deleteDb(int id) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    final db = await instance.database;
    await db!.delete(
      table, where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    print(id);
  }

  // CLOSE DB
  Future closeDb() async {
    final db = await instance.database;
    db!.close();
  }
}
