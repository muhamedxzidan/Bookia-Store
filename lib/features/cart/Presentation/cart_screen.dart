import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/cart/Presentation/widgets/cart_list_view.dart';
import 'package:bookia_store/features/cart/cubit/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      children: [
        Text(
          AppStrings.cartScreenTitle.tr(),
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 24.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        SizedBox(height: 56.h),
        const Expanded(child: CartListView()),
      ],
    ),
  );
}
