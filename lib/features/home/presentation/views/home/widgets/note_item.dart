import 'package:figmanoteapp/core/extensions/center_extension.dart';
import 'package:figmanoteapp/core/extensions/padding_extension.dart';
import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:figmanoteapp/features/home/bussenes_logic/cubit/note_cubit.dart';
import 'package:figmanoteapp/features/home/presentation/widgets/custom_dialog.dart';
import 'package:figmanoteapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class NoteItem extends StatelessWidget {
  NoteItem({
    super.key,
    required this.cubit,
    required this.index,
  });

  final NoteCubit cubit;
  int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: ListTile(
        title: Container(
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: white,
              size: 42.sp,
            ),
          ).center(),
        ),
      ),
      child: ListTile(
        tileColor: colors[cubit.notes[index].colorIndex],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        title: Text(
          cubit.notes[index].title,
          style: whiteTextStyle().copyWith(
            color: black,
            fontSize: 24.sp,
          ),
        ).padding(30.w, 30.h),
        onTap: () {
          cubit.moveTitleAndContentTextToEdit(cubit.notes[index].title,
              cubit.notes[index].content, cubit.notes[index].colorIndex);
          Navigator.pushNamed(
            context,
            editNote,
            arguments: [
              cubit.notes[index].title,
              cubit.notes[index].content,
              cubit.notes[index].id,
              cubit.notes[index].colorIndex,
            ],
          );
        },
      ).padding(24.w, 12.h),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
                icon: Icon(
                  Icons.delete,
                  color: red,
                  size: 36.sp,
                ),
                text: S.of(context).deleteMessage,
                onPressed: () {
                  cubit.deleteNote(cubit.notes[index].id!);
                  Navigator.pop(context);
                },
                buttonText: S.of(context).delete);
          },
        );
      },
    );
  }
}
