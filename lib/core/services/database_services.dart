import 'package:figmanoteapp/features/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table ${NoteField.tableName} ( 
  ${NoteField.id} integer primary key autoincrement, 
  ${NoteField.title} text,
  ${NoteField.content} text,
  ${NoteField.colorIndex} integer)
''');
    });
  }

  Future<Map<String, dynamic>> insert(Map<String, dynamic> note) async {
    await open(NoteField.tableName);
    await db.insert(NoteField.tableName, note);
    await close();
    return note;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    await open(NoteField.tableName);
    return await db.query(
      NoteField.tableName,
      columns: NoteField.values(),
    );
  }

  Future<int> delete(int id) async {
    await open(NoteField.tableName);
    return await db.delete(
      NoteField.tableName,
      where: '${NoteField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(NoteModel note) async {
    await open(NoteField.tableName);
    try {
      return await db.update(NoteField.tableName, note.toMap(),
          where: '${NoteField.id} = ?', whereArgs: [note.id]);
    } on Exception catch (e) {
      throw Exception('Failed to update note from database : $e');
    }
  }

  Future close() async {
    await db.close();
  }
}
