import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) => Pinput(
    length: 6,
    defaultPinTheme: PinTheme(
      width: 48,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColor),
      ),
    ),
    focusedPinTheme: PinTheme(
      width: 48,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.secondaryColor),
      ),
    ),
    submittedPinTheme: PinTheme(
      width: 48,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColor),
      ),
    ),
  );
}
