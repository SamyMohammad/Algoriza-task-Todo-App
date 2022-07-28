import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';

class DbHelper {
  static Database? _database;
 static const int _version=4;
  static const String _tableName='tasks';


 static Future<Database?> get getDatabase async {
    if (_database == null) {
      _database = await initialDb();
      return _database;
    } else {
      return _database;
    }
  }

 static  initialDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'Todos.db');
    Database? database = await openDatabase(path, onCreate: _onCreate,onUpgrade: onUpgrade,version: _version,onOpen:onOpen );
    return database;
  }
 static onUpgrade(Database db ,int oldVersion,int newVersion){
print('onUpgrade ==============');
  }
  static onOpen(Database db ){

    print('onOpen ==============');
  }

 static _onCreate(Database database, int version) async {
    await database.execute('''
CREATE TABLE $_tableName (
'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
'title' TEXT ,
'date' TEXT ,
'startTime' TEXT ,
'endTime' TEXT ,
'reminder' INTEGER ,
'color' INTEGER ,
'isCompleted' INTEGER ,
'isUnCompleted' INTEGER ,
'isFavourite' INTEGER 
)
''');
    print('create');
  }

 static readData()async{
    Database? myDB = await getDatabase  ;
    List<Map<String, dynamic>> response =await myDB!.query(_tableName);
    print('on read data  ==============');
    return response;
  }

 static insertData(TaskModel taskModel)async{
   Database?  myDB = await getDatabase  ;
    int response =await myDB!.insert(_tableName, taskModel.toJson());
    print('on insert data  ==============');

    return response;
  }

 static updateData(String sql,int id,int isCompleted)async{
    Database? myDB = await getDatabase  ;
    int response =await myDB!.rawUpdate(sql,[isCompleted,id]);
    print('on insert data  ==============');

    return response;
  }

 static deleteData(TaskModel? taskModel)async{
    Database? myDB = await getDatabase  ;
    int response =await myDB!.delete(_tableName,where: 'id = ?',whereArgs: [taskModel!.id]);
    print('on delete data  ==============');

    return response;
  }

}
