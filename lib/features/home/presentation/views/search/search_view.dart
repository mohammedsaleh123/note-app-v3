import 'package:figmanoteapp/core/app/widgets/custom_text_field.dart';
import 'package:figmanoteapp/features/home/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/home/presentation/views/home/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<NoteCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: CustomTextField(
              textController: cubit.searchByTitleController,
              hintText: 'Search by title',
              onChanged: (p0) {
                cubit.searchByTitle(p0);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.searchByTitle(cubit.searchByTitleController.text);
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.clearSearchField();
                },
                icon: const Icon(Icons.clear),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: cubit.notes.length,
              itemBuilder: (context, index) {
                return NoteItem(cubit: cubit, index: index);
              }),
        );
      },
    );
  }
}
