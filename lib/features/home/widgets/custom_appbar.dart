import 'package:figmanoteapp/core/theme/app_theme.dart';
import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: whiteTextStyle(),
          ),
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: deepGrey,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
              SizedBox(width: 21.w),
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: deepGrey,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
