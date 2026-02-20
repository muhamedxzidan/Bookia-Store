import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppTextFormFild extends StatefulWidget {
  AppTextFormFild({
    super.key,
    required this.hintText,
    this.svgPicture,
    this.obscureText = false,
    this.color,
    this.isPassword = false,
  });

  final String hintText;
  final SvgPicture? svgPicture;
  final bool obscureText;
  final Color? color;
  bool isPassword;

  @override
  State<AppTextFormFild> createState() => _AppTextFormFildState();
}

class _AppTextFormFildState extends State<AppTextFormFild> {
  @override
  Widget build(BuildContext context) => TextFormField(
    onTapOutside: (event) {
      FocusScope.of(context).unfocus();
    },
    obscureText: widget.obscureText,

    decoration: InputDecoration(
      fillColor: widget.color,
      filled: true,
      hintText: widget.hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            widget.isPassword = !widget.isPassword;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: widget.svgPicture,
        ),
      ),
    ),
  );
}
