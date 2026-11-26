import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._(); //to make constrcutor private
  static DbHelper getInstance() => DbHelper._(); //singletone instance

  Database? db; //db object
  static const String dbName = 'notes.db';

  static const String tableNote = "note"; //table name
  static const String noteId = "note_id";
  static const String noteTitle = "note_title";
  static const String noteDescription = "note_description";
  static const String noteCreatedAt = "note_created_at";

  //initalize db
  Future<Database> initDb() async {
    if(db == null ){
      db = await openDb();
    }
    return db!;
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory(); //we will store sqlite db there in some path
    String path =  join(appDir.path,dbName);
    return await openDatabase(path, version: 1 ,onCreate: (db, version) {
      db.execute("create table $tableNote ($noteId integer primary key autoincrement,$noteTitle text,$noteDescription text ,$noteCreatedAt text)");
    },);
  }
  Future<bool> add({required String title,required String  description}) async {
    Database db = await initDb();
    int rows = await db.insert(tableNote, {
      noteTitle : title,
    noteDescription : description,
      noteCreatedAt : DateTime.now().microsecondsSinceEpoch.toString()
    });
  return rows>0;
  }

  //fetch
  Future<List<Map<String,dynamic>>> getAllNotes() async {
    Database db = await initDb();
    return await db.query(tableNote);
  }

  Future<bool> updateNote({required int Id,required String title,required String description})async{
    Database db = await initDb();
    int rows = await db.update(tableNote,{
      noteTitle : title,
      description : description,
    },where: "$noteId = ?",whereArgs: ["$Id"]);
    //for multiple args
  // },where: "$noteId = ? AND $noteTitle = ? ",whereArgs: ["$Id","$title"]);

  return rows>0;
  }

  Future<bool> deleteNote({required int Id}) async{
        Database db = await initDb();
        int row = await db.delete(tableNote,where: "$noteId = ?",whereArgs: ["$Id"]);
        return row>0;
  }
}
//02:10