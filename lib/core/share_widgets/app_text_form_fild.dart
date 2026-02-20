import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormFild extends StatefulWidget {
  const AppTextFormFild({
    super.key,
    required this.hintText,
    this.svgPicture,
    this.color,
    this.isPassword = false,
  });

  final String hintText;
  final SvgPicture? svgPicture;
  final Color? color;
  final bool isPassword;

  @override
  State<AppTextFormFild> createState() => _AppTextFormFildState();
}

class _AppTextFormFildState extends State<AppTextFormFild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) => TextFormField(
    keyboardType: widget.isPassword
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onTapOutside: (event) {
      FocusScope.of(context).unfocus();
    },

    obscureText: widget.isPassword && obscureText,

    decoration: InputDecoration(
      fillColor: widget.color,
      filled: true,
      hintText: widget.hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
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
