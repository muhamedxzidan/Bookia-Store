import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/home/Presentation/widget/book_card.dart';
import 'package:bookia_store/features/home/Presentation/widget/home_slider.dart';
import 'package:bookia_store/features/home/cubit/home_cubit.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final _dummyBooks = List.generate(
    4,
    (_) => BookProduct(id: 0, name: 'Book Title', price: '285', image: null),
  );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.icons.logo, width: 20.w),
                SizedBox(width: 7.w),
                Text(
                  AppStrings.homeBrandName.tr(),
                  style: TextStyle(
                    fontFamily: 'DM Serif Display',
                    fontSize: 22.sp,
                    color: AppColors.darkTextColor,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(Assets.icons.search, width: 24.w),
          ],
        ),
        SizedBox(height: 22.h),
        const HomeSlider(),
        SizedBox(height: 24.h),
        Text(
          AppStrings.homeBestSeller.tr(),
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 24.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        SizedBox(height: 10.h),

        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is GetBestSellerLoading ||
              current is GetBestSellerSuccess ||
              current is GetBestSellerError,
          builder: (context, state) {
            final isLoading = state is GetBestSellerLoading;
            final books = state is GetBestSellerSuccess
                ? state.bestSellers
                : _dummyBooks;

            return Skeletonizer(
              enabled: isLoading,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: books.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) =>
                    BookCard(product: books[index]),
              ),
            );
          },
        ),
        SizedBox(height: 12.h),
      ],
    ),
  );
}
