import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppStrings.wishlistScreenTitle.tr()));
}
