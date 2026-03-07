import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppStrings.profileScreenTitle.tr()));
}
