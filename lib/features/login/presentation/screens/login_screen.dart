import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_images.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/core/widgets/custom_button.dart';
import 'package:twos_home_wear_app/core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  // height based on design to be responsive (logo height / screen height = 0.0947)
                  height: screenHeight * 0.0947,
                  AppImages.appLogoImage,
                ),
                SizedBox(height: 12),
                Text('2S HOMEWEAR', style: AppStyles.bold20Text),
                SizedBox(height: 2),
                Text('Sales Portal', style: AppStyles.medium14Text),
                SizedBox(height: 24),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Username / Email',
                    style: AppStyles.semiBold14Text,
                  ),
                ),
                SizedBox(height: 6),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'username',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.greyColor,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Password', style: AppStyles.semiBold14Text),
                ),
                SizedBox(height: 6),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppColors.greyColor,
                  ),
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 24),
                CustomButton(text: 'Log In', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
