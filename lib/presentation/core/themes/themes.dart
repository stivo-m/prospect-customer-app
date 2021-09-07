import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.accentColor,
      primaryTextTheme: GoogleFonts.ralewayTextTheme().copyWith(
        bodyText1: TextStyle(color: AppColors.blackColor),
        headline1: TextStyle(color: AppColors.blackColor),
        headline2: TextStyle(color: AppColors.blackColor),
        headline3: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: GoogleFonts.ralewayTextTheme().copyWith(
        button: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}

class AppColors {
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color blackColor = Color(0XFF2a2d34);
  static const Color greyColor = Color(0XFFFFFF);
  static const Color lightGreyColor = Color(0XFFf5f5f5);
  static const Color primaryColor = Colors.deepPurple;
  static const Color blueColor = Colors.indigo;
  static const Color dangerColor = Color(0XFFF3C38);
  static const Color successColor = Color(0XFF109322);
  static const Color accentColor = Colors.deepOrange;
}
