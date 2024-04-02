import 'package:figmanoteapp/core/extensions/padding_extension.dart';
import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:figmanoteapp/core/app/widgets/custom_button.dart';
import 'package:figmanoteapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });
  final Icon icon;
  final String text;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: black,
      content: SizedBox(
        height: 236.h,
        width: 330.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              text,
              style: whiteTextStyle().copyWith(fontSize: 23.sp, color: grey),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: red,
                  radius: 5.sp,
                  minWidth: 112.w,
                  child: Text(
                    S.of(context).discard,
                    style: whiteTextStyle().copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: onPressed,
                  color: green,
                  radius: 5.sp,
                  minWidth: 112.w,
                  child: Text(
                    buttonText,
                    style: whiteTextStyle().copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).padding(8.w, 16.h),
      ),
    );
  }
}
