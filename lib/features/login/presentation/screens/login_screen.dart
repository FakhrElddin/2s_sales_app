import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_images.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/core/widgets/custom_app_dialog.dart';
import 'package:twos_home_wear_app/core/widgets/custom_button.dart';
import 'package:twos_home_wear_app/core/widgets/custom_text_form_field.dart';
import 'package:twos_home_wear_app/features/login/presentation/manager/login_cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
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
                      controller: emailController,
                      hintText: 'username',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.greyColor,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('Password', style: AppStyles.semiBold14Text),
                    ),
                    SizedBox(height: 6),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.greyColor,
                      ),
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.homeScreenRoute,
                            (route) => false,
                          );
                        } else if (state is LoginError) {
                          CustomAppDialog.showError(
                            context: context,
                            title: 'Login Failed',
                            description: state.failures.errorMessage,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else {
                          return CustomButton(
                            text: 'Log In',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } else {
                                setState(() {
                                  autoValidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
