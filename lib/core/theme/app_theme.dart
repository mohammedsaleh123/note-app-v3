import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: black,
      appBarTheme: const AppBarTheme(backgroundColor: black),
      dialogTheme: const DialogTheme(
        backgroundColor: black,
      ));
}

TextStyle whiteTextStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 33.sp, fontWeight: FontWeight.normal);
}
