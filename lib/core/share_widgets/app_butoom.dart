import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.color,
    this.title,
    // ignore: non_constant_identifier_names
    this.AppTextStyle,
  });

  final VoidCallback? onPressed;
  final Color? color;
  final String? title;
  // ignore: non_constant_identifier_names
  final TextStyle? AppTextStyle;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 19.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(title!, style: AppTextStyle),
    ),
  );
}
