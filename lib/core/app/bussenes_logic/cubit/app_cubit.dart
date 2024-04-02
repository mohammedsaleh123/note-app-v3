import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  String languageCode = 'en';

  void changeLanguage() {
    emit(ChangeLanguageLoading());
    try {
      if (languageCode == 'en') {
        languageCode = 'ar';
      } else {
        languageCode = 'en';
      }
      emit(ChangeLanguageSuccess());
    } on Exception catch (e) {
      emit(ChangeLanguageError());
      throw Exception('Failed to change language from cubit : $e');
    }
  }
}
