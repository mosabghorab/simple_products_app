import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_products_app/src/config/helpers.dart';

class AppTheme {
  // light theme.
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: Helpers.getFontFamily(),
      primaryColor: const Color(0xff3EB86F),
      colorScheme: const ColorScheme.light(
        primary: Color(0xff3EB86F),
      ),
      scaffoldBackgroundColor: const Color(0xffF9F9F9),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xff3EB86F),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          fontFamily: Helpers.getFontFamily(),
          color: const Color(0xff3EB86F),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff3EB86F),
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: Helpers.getFontFamily(),
          ),
          fixedSize: Size(double.infinity, 44.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

// dark theme.
// static ThemeData darkTheme() {
//   return ThemeData(
//     fontFamily: Utils.getFontFamily(),
//     primaryColor: const Color(0xffF1734F),
//     colorScheme: const ColorScheme.dark(
//       primary: Color(0xffF1734F),
//     ),
//     appBarTheme: AppBarTheme(
//       backgroundColor: const Color(0xffF1734F),
//       elevation: 0,
//       centerTitle: true,
//       titleTextStyle: TextStyle(
//         fontSize: 22.sp,
//         fontWeight: FontWeight.w600,
//         fontFamily: Utils.getFontFamily(),
//         color: const Color(0xffF1734F),
//       ),
//     ),
//   );
// }
}
