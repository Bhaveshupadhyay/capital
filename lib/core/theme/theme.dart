import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.whiteColor,
    ),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppColor.whiteColor,
      ),
      side: BorderSide.none,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      bodySmall: TextStyle(
        color: Colors.black
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(15.r),
      border: InputBorder.none
    ),
  );

  static final lightGradient=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Colors.grey[400]!,
      Colors.grey[200]!,
      Colors.grey[300]!,
      Colors.grey[200]!,
      Colors.grey[200]!
    ],
    stops: const <double>[
      0.0,
      0.35,
      0.5,
      0.65,
      1.0
    ],
  );
  static const profileColors = [
    Colors.amber,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
}