import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonBack extends StatelessWidget {
  const AppButtonBack({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.pop(context),
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8ECF4)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: const Center(
        child: Icon(Icons.arrow_back_ios_new, size: 18),
      ),
    ),
  );
}
