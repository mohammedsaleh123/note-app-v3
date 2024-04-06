import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.text,
      this.iconButton,
      this.iconButton2,
      this.arrowBack});
  final String text;
  final IconButton? iconButton;
  final Widget? iconButton2;
  final Widget? arrowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(child: arrowBack),
          Text(
            text,
            style: whiteTextStyle().copyWith(
              fontSize:
                  const Locale.fromSubtags(languageCode: 'ar').languageCode ==
                          'en'
                      ? 32.sp
                      : 24.sp,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: deepGrey,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: iconButton,
              ),
              SizedBox(width: 21.w),
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: deepGrey,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: iconButton2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
