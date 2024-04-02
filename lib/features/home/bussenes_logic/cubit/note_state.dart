part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class CreateDatabaseLoading extends NoteState {}

final class CreateDatabaseSuccess extends NoteState {}

final class CreateDatabaseFailed extends NoteState {}

final class GetNotesLoading extends NoteState {}

final class GetNotesSuccess extends NoteState {}

final class GetNotesFailed extends NoteState {}

final class InsertNoteLoading extends NoteState {}

final class InsertNoteSuccess extends NoteState {}

final class InsertNoteFailed extends NoteState {}

final class UpdateNoteLoading extends NoteState {}

final class UpdateNoteSuccess extends NoteState {}

final class UpdateNoteFailed extends NoteState {}

final class DeleteNoteLoading extends NoteState {}

final class DeleteNoteSuccess extends NoteState {}

final class DeleteNoteFailed extends NoteState {}

final class MoveTitleAndContentTextToEditLoading extends NoteState {}

final class MoveTitleAndContentTextToEditSuccess extends NoteState {}

final class MoveTitleAndContentTextToEditFailed extends NoteState {}

final class SearchByTitleLoading extends NoteState {}

final class SearchByTitleSuccess extends NoteState {}

final class SearchByTitleFailed extends NoteState {}
