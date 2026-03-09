import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/wishlist/Presentation/widget/wishlist_item_card.dart';
import 'package:bookia_store/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static final _dummyProducts = List.generate(
    3,
    (_) => BookProduct(id: 0, name: 'Book Title', price: '285', image: null),
  );

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      children: [
        Text(
          AppStrings.wishlistScreenTitle.tr(),
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 24.sp,
            color: AppColors.darkTextColor,
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: BlocBuilder<WishlistCubit, WishlistState>(
            buildWhen: (previous, current) =>
                current is GetWishlistLoading ||
                current is GetWishlistSuccess ||
                current is GetWishlistError,
            builder: (context, state) {
              final isLoading = state is GetWishlistLoading;
              final products = state is GetWishlistSuccess
                  ? state.products
                  : _dummyProducts;

              if (state is GetWishlistSuccess && products.isEmpty) {
                return Center(
                  child: Text(
                    'No items in wishlist',
                    style: TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 16.sp,
                      color: AppColors.hintTextDescriptionColor,
                    ),
                  ),
                );
              }

              return Skeletonizer(
                enabled: isLoading,
                child: ListView.separated(
                  itemCount: products.length,
                  // ignore: unnecessary_underscores
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) => WishlistItemCard(
                    product: products[index],
                    onRemove: () {
                      if (products[index].id != null) {
                        context.read<WishlistCubit>().removeFromWishlist(
                          products[index].id!,
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
