import 'package:figmanoteapp/core/extensions/padding_extension.dart';
import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:figmanoteapp/core/app/widgets/custom_text_field.dart';
import 'package:figmanoteapp/features/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/data/models/note_model.dart';
import 'package:figmanoteapp/core/app/widgets/custom_appbar.dart';
import 'package:figmanoteapp/core/app/widgets/custom_dialog.dart';
import 'package:figmanoteapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.title,
    required this.content,
    required this.index,
    required this.colorIndex,
  });
  final String title;
  final String content;
  final int index;
  final int colorIndex;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).moveTitleAndContentTextToEdit(
        widget.title, widget.content, widget.colorIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<NoteCubit>(context);
            return Column(
              children: [
                CustomAppBar(
                  arrowBack: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: deepGrey,
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                  text: S.of(context).editNote,
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.info_outline),
                  ),
                  iconButton2: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              icon: const Icon(Icons.edit),
                              text: S.of(context).editMessage,
                              onPressed: () {
                                cubit.updateNote(
                                  NoteModel(
                                    title: cubit.editTitleController.text,
                                    content: cubit.editContentController.text,
                                    id: widget.index,
                                    colorIndex: widget.colorIndex,
                                  ),
                                );
                                Navigator.pushReplacementNamed(context, home);
                              },
                              buttonText: S.of(context).edit,
                            );
                          });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                CustomTextField(
                  textController: cubit.editTitleController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 24.sp),
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: whiteTextStyle().copyWith(
                      fontSize: 48.sp,
                      color: grey,
                    ),
                  ),
                  maxLines: 1,
                ).padding(0, 12.h),
                CustomTextField(
                  textController: cubit.editContentController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.sp, vertical: 12.sp),
                    border: InputBorder.none,
                    hintText: 'Type something...',
                    hintStyle: whiteTextStyle().copyWith(
                      fontSize: 23.sp,
                      color: grey,
                    ),
                  ),
                  maxLines: null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
