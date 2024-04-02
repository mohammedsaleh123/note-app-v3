import 'package:figmanoteapp/core/extensions/padding_extension.dart';
import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:figmanoteapp/core/app/widgets/custom_text_field.dart';
import 'package:figmanoteapp/features/home/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/home/presentation/widgets/custom_appbar.dart';
import 'package:figmanoteapp/features/home/presentation/widgets/custom_dialog.dart';
import 'package:figmanoteapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<NoteCubit>(context);
          return SafeArea(
            child: Column(
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
                  text: S.of(context).addNote,
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_outlined)),
                  iconButton2: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              icon: const Icon(Icons.save),
                              text: S.of(context).addMessage,
                              onPressed: () {
                                cubit.insertNote(
                                  cubit.titleController.text,
                                  cubit.contentController.text,
                                );
                                Navigator.pushReplacementNamed(context, home);
                              },
                              buttonText: S.of(context).save,
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.save)),
                ),
                CustomTextField(
                  textController: context.read<NoteCubit>().titleController,
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
                  textController: context.read<NoteCubit>().contentController,
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
            ),
          );
        },
      ),
    );
  }
}
