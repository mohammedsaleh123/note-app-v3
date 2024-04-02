import 'package:figmanoteapp/core/route/route_strings.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.sp),
      onTap: () {
        Navigator.pushNamed(context, addNote);
      },
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(50.sp),
          boxShadow: [
            BoxShadow(
              color: deepBlack,
              blurRadius: 5.sp,
              spreadRadius: 0.5.sp,
              offset: const Offset(5, 5),
            )
          ],
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
