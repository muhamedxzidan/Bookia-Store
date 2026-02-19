import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormFild extends StatelessWidget {
  const AppTextFormFild({
    super.key,
    required this.hintText,
    this.svgPicture,
    this.obscureText = false,
  });

  final String hintText;
  final SvgPicture? svgPicture;
  final bool obscureText;

  @override
  Widget build(BuildContext context) => TextFormField(
    onTapOutside: (event) {
      FocusScope.of(context).unfocus();
    },
    obscureText: obscureText,

    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      suffixIcon: svgPicture,
    ),
  );
}
