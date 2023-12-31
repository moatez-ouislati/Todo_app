import 'package:sqflite/sqflite.dart'; // sqflite db
import 'package:path/path.dart'; // path package
import './todolist_model.dart'; // todolist_model

class DatabaseConnect{
  Database? _database;

// creation a getter et 
//ouvrir connection vers db
Future<Database> get database async{
  // localistion db
  final dbpath = await getDatabasesPath();
  // nom de la liste
  const dbname = 'tasks.db';
  //creation path complet pour db

  final path = join(dbpath, dbname);

  //ouvirir la connetion

  _database = await openDatabase(path, version: 1, onCreate: _createDB);
  // creation _createDB

  return _database!;

}

// creation _create db fonction
// creation table 

Future<void> _createDB(Database db, int version) async{
  //verification creation table qui convient avec todolist
  await db.execute('''
    CREATE TABLE tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      isCompleted, INTEGER
    )
  ''');
}

//fonction pour ajouter data 
Future<void> insertTask(Tasks tasks) async{
  // reprend la connection vers db
  final db = await database;

  //insert
  await db.insert('tasks', //nom de table
  tasks.toMap(),
   conflictAlgorithm: ConflictAlgorithm.replace,

  );

}


// fonction pour supprimer task dans database
Future<void> deleteTask(Tasks tasks) async{
  final db = await database;
  //supprimer taks dans database en se base de id
  await db.delete(
    'tasks',
   where: 'id == ?',
    whereArgs: [tasks.id], //verification id dans tasks list
    );
}

// fonction pour faire fetch tasks data dans database
Future<List<Tasks>> getTask() async{
  final db  = await database;
  List<Map<String, dynamic>> items = await db.query(
    'tasks', 
    orderBy: 'id DESC', 
    );// pour faire l'dore d'une list
    // derniers task sera affiché le premier dans la liste

    // convertir items de la liste de map vers la liste des taks

    return List.generate(items.length,
    (i) => Tasks(id: items[i]['id'], 
    title: items[i]['title'],
    isCompleted: items[i]['isCompleted'] == 1 ? true : false, // convertir integer au boolean 1 = true , 0 =
     ),
    );
  }

}