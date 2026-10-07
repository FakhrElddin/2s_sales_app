import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold20Text = TextStyle(
    color: AppColors.textPrimaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle regular16Text = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static TextStyle bold16Text = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle medium14Text = TextStyle(
    color: AppColors.textSecondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle semiBold14Text = TextStyle(
    color: AppColors.textPrimaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
