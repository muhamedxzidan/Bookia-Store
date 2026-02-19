import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onPressed, this.color, this.title});

  final VoidCallback? onPressed;
  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 19.h),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Text(title!),
  );
}
