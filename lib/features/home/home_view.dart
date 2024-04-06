import 'package:figmanoteapp/core/app/bussenes_logic/cubit/app_cubit.dart';
import 'package:figmanoteapp/core/extensions/padding_extension.dart';
import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/features/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/home/widgets/empty_widget.dart';
import 'package:figmanoteapp/features/home/widgets/fab.dart';
import 'package:figmanoteapp/features/home/widgets/note_item.dart';
import 'package:figmanoteapp/core/app/widgets/custom_appbar.dart';
import 'package:figmanoteapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context)
      ..createDatabase()
      ..getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<NoteCubit, NoteState>(listener: (context, state) {}),
          BlocListener<AppCubit, AppState>(listener: (context, state) {}),
        ],
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                text: S.of(context).homeTitle,
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, search);
                    },
                    icon: const Icon(Icons.search)),
                iconButton2: PopupMenuButton(
                  onSelected: (value) {
                    //controller.setType(value.toString());
                  },
                  itemBuilder: (context) {
                    final appCubit = BlocProvider.of<AppCubit>(context);
                    return [
                      PopupMenuItem(
                        onTap: () {
                          appCubit.changeLanguage();
                        },
                        value: 'AR',
                        child: Text(S.of(context).stringLangKey),
                      ),
                    ];
                  },
                  child: const Icon(Icons.arrow_drop_down).padding(10.w, 10.h),
                ),
              ),
              Expanded(
                child: context.watch<NoteCubit>().notes.isEmpty
                    ? const EmptyWidget()
                    : ListView.builder(
                        itemCount: context.watch<NoteCubit>().notes.length,
                        itemBuilder: (context, index) {
                          return NoteItem(
                              cubit: context.watch<NoteCubit>(), index: index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
