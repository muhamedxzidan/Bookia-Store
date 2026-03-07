import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});

  final BookProduct product;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: AppColors.bookCardBackgroundColor,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              product.image ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              // ignore: unnecessary_underscores
              errorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.book, size: 48)),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          product.name ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 17.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              '₹${product.price ?? '0'}',
              style: TextStyle(
                fontFamily: 'DM Serif Display',
                fontSize: 18.sp,
                color: AppColors.darkTextColor,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 72.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkTextColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  AppStrings.buy.tr(),
                  style: TextStyle(
                    fontFamily: 'DM Serif Display',
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
