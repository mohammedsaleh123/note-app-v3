import 'package:figmanoteapp/core/services/database_services.dart';
import 'package:figmanoteapp/features/data/repository/note_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton(DatabaseServices());
  sl.registerSingleton(NoteRepo());
}
