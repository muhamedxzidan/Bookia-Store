import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppStrings.cartScreenTitle.tr()));
}
