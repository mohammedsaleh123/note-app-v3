import 'package:figmanoteapp/core/services/service_locator.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:figmanoteapp/features/home/data/models/note_model.dart';
import 'package:figmanoteapp/features/home/data/repository/note_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editContentController = TextEditingController();
  TextEditingController searchByTitleController = TextEditingController();
  List<NoteModel> notes = [];
  int? colorIndex;

  Future<void> createDatabase() async {
    emit(CreateDatabaseLoading());
    try {
      await sl<NoteRepo>().createDatabase(NoteField.tableName);
      emit(
        CreateDatabaseSuccess(),
      );
    } catch (e) {
      emit(
        CreateDatabaseFailed(),
      );
      throw Exception('Failed to create database from cubit : $e');
    }
  }

  Future<void> insertNote(String title, String content) async {
    emit(InsertNoteLoading());
    try {
      await sl<NoteRepo>().insert(
        NoteModel(
          title: title,
          content: content,
          colorIndex: Random().nextInt(colors.length),
        ),
      );
      getNotes();
      emit(InsertNoteSuccess());
      titleController.clear();
      contentController.clear();
      sl<NoteRepo>().close();
    } catch (e) {
      emit(InsertNoteFailed());
      throw Exception('Failed to insert note from cubit : $e');
    }
  }

  Future<List<NoteModel>> getNotes() async {
    emit(GetNotesLoading());
    try {
      notes = await sl<NoteRepo>().getAllNotes();
      emit(
        GetNotesSuccess(),
      );
      return notes;
    } catch (e) {
      emit(
        GetNotesFailed(),
      );
      throw Exception('Failed to get notes from cubit : $e');
    }
  }

  Future<void> deleteNote(int id) async {
    emit(DeleteNoteLoading());
    try {
      await sl<NoteRepo>().delete(id);
      notes = await sl<NoteRepo>().getAllNotes();
      emit(DeleteNoteSuccess());
      getNotes();
      sl<NoteRepo>().close();
    } catch (e) {
      emit(DeleteNoteFailed());
      throw Exception('Failed to delete note from cubit : $e');
    }
  }

  Future<void> updateNote(NoteModel note) async {
    emit(UpdateNoteLoading());
    try {
      await sl<NoteRepo>().update(note);
      notes = await sl<NoteRepo>().getAllNotes();
      emit(UpdateNoteSuccess());
      getNotes();
      editTitleController.clear();
      editContentController.clear();
      sl<NoteRepo>().close();
    } catch (e) {
      emit(UpdateNoteFailed());
      throw Exception('Failed to update note from cubit : $e');
    }
  }

  void moveTitleAndContentTextToEdit(
      String title, String content, int colorIndex) {
    emit(MoveTitleAndContentTextToEditLoading());
    editTitleController = TextEditingController();
    editContentController = TextEditingController();
    try {
      editTitleController.text = title;
      editContentController.text = content;
      emit(MoveTitleAndContentTextToEditSuccess());
    } on Exception catch (e) {
      emit(MoveTitleAndContentTextToEditFailed());
      throw Exception('Failed to move title and content text to edit : $e');
    }
  }

  void searchByTitle(String title) {
    emit(SearchByTitleLoading());
    try {
      notes = notes.where((element) {
        return element.title.toLowerCase().contains(title.toLowerCase());
      }).toList();
      if (title.isEmpty) {
        getNotes();
      }
      emit(SearchByTitleSuccess());
      //searchByTitleController.clear();
    } on Exception catch (e) {
      emit(SearchByTitleFailed());
      throw Exception('Failed to search by title : $e');
    }
  }

  clearSearchField() {
    searchByTitleController.clear();
    getNotes();
  }
}
