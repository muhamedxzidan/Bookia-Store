import 'package:bookia_store/core/routing/routes.dart';
import 'package:bookia_store/core/share_widgets/app_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_butoom_back.dart';
import 'package:bookia_store/core/share_widgets/app_text_butoom.dart';
import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:bookia_store/features/auth/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Builder(
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const AppButtonBack(),
                SizedBox(height: 28.h),
                Text(
                  AppStrings.titleRegister.tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32.h),
                AppTextFormFild(
                  controller: nameController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextUserName.tr(),
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  controller: emailController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextEmail.tr(),
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  controller: passwordController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextPassword.tr(),
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  controller: passwordConfirmationController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextConfirmPassword.tr(),
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  controller: addressController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextAddress.tr(),
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  controller: cityController,
                  color: AppColors.hintTextColor,
                  hintText: AppStrings.hintTextCity.tr(),
                ),
                SizedBox(height: 30.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthRegisterLoadingState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loading...')),
                      );
                    } else if (state is AuthRegisterSuccessState) {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    } else if (state is AuthRegisterErrorState) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  child: AppButton(
                    onPressed: () {
                      context.read<AuthCubit>().register(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        passwordConfirmation:
                            passwordConfirmationController.text,
                        address: addressController.text,
                        city: cityController.text,
                      );
                    },
                    color: AppColors.primaryColor,
                    title: AppStrings.register.tr(),
                    AppTextStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 184.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButoom(
                      text: AppStrings.hintTextAlreadyHaveAccount.tr(),
                    ),
                    AppTextButoom(
                      text: AppStrings.loginNow.tr(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 27.h),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
