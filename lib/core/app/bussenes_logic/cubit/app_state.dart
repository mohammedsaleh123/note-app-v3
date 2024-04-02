part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class ChangeLanguageLoading extends AppState {}

final class ChangeLanguageSuccess extends AppState {}

final class ChangeLanguageError extends AppState {}
