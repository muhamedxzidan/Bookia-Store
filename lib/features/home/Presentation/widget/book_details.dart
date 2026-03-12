import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product});

  final BookProduct product;

  @override
  Widget build(BuildContext context) =>
      BlocListener<WishlistCubit, WishlistState>(
        listener: (context, state) {
          if (state is AddToWishlistSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.green,
                content: Text('Added to Wishlist Successfully'),
              ),
            );
          } else if (state is AddToWishlistError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.redAccent,
                content: Text('Failed to add to Wishlist'),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 75.w,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 41.w,
                height: 41.h,
                margin: EdgeInsets.only(left: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.hintTextColor),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<WishlistCubit>().addToWishlist(product.id!);
                },
                icon: const Icon(Icons.bookmark_border, color: Colors.black),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.r),
                          child: Image.network(
                            product.image ?? '',
                            height: 271.h,
                            width: 183.w,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Icon(
                              Icons.book,
                              size: 120.sp,
                              color: AppColors.hintTextDescriptionColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        product.name ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 30.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        AppStrings.bookType.tr(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          product.description ?? '',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12.sp,
                            height: 1.845,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  children: [
                    Text(
                      '₹${product.price ?? '0'}',
                      style: TextStyle(
                        fontFamily: 'DM Serif Display',
                        fontSize: 24.sp,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: AppColors.darkTextColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            AppStrings.addToCart.tr(),
                            style: TextStyle(
                              fontFamily: 'DM Serif Display',
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
