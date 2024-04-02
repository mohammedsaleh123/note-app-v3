import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/features/home/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/home/presentation/views/add_note/add_note_view.dart';
import 'package:figmanoteapp/features/home/presentation/views/edit_note/edit_note_view.dart';
import 'package:figmanoteapp/features/home/presentation/views/home/home_view.dart';
import 'package:figmanoteapp/features/home/presentation/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NoteCubit(),
            child: const HomeView(),
          ),
        );
      case addNote:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: NoteCubit(),
            child: const AddNoteScreen(),
          ),
        );
      case editNote:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final title = args[0];
        final content = args[1];
        final index = args[2];
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: NoteCubit(),
            child: EditNoteView(
              title: title,
              content: content,
              index: index,
            ),
          ),
        );

      case search:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: NoteCubit(),
            child: const SearchView(),
          ),
        );
    }
    return null;
  }
}
