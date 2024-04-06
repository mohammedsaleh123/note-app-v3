import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          child: SizedBox(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty_notes.png',
                ),
                SizedBox(height: 7.h),
                Text(
                  'Create your first note !',
                  style: whiteTextStyle().copyWith(fontSize: 21.sp),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
