import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_constants.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: AppConstants.interFontFamily,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 28),
      unselectedIconTheme: IconThemeData(color: AppColors.greyColor, size: 28),
      unselectedItemColor: AppColors.greyColor,
      selectedItemColor: AppColors.primaryColor,
    ),
  );
}
