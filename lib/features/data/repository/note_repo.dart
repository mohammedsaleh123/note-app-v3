import 'package:figmanoteapp/core/services/database_services.dart';
import 'package:figmanoteapp/core/services/service_locator.dart';
import 'package:figmanoteapp/features/data/models/note_model.dart';

class NoteRepo {
  Future<bool> createDatabase(String databaseTable) async {
    try {
      await sl<DatabaseServices>().open(databaseTable);
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to create database : $e');
    }
  }

  Future<List<NoteModel>> getAllNotes() async {
    try {
      return await sl<DatabaseServices>().getAllNotes().then((notes) {
        return notes.map((e) => NoteModel.fromMap(e)).toList();
      });
    } on Exception catch (e) {
      throw Exception('Failed to get notes from rebo : $e');
    }
  }

  Future<bool> insert(NoteModel note) async {
    try {
      await sl<DatabaseServices>().insert(note.toMap());
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to insert note from rebo : $e');
    }
  }

  Future<bool> delete(int id) async {
    try {
      await sl<DatabaseServices>().delete(id);
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to delete note from rebo : $e');
    }
  }

  Future<bool> update(NoteModel note) async {
    try {
      await sl<DatabaseServices>().update(note);
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to update note from rebo : $e');
    }
  }

  Future<bool> close() async {
    try {
      sl<DatabaseServices>().close();
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to close database from rebo : $e');
    }
  }
}
