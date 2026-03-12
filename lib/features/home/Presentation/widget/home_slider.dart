import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/features/home/cubit/home_cubit.dart';
import 'package:bookia_store/features/home/data/models/slider_models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    buildWhen: (previous, current) =>
        current is HomeLoading || current is HomeLoaded || current is HomeError,
    builder: (context, state) {
      final isLoading = state is HomeLoading || state is HomeInitial;
      final sliders = state is HomeLoaded
          ? state.sliders
          : <SliderImage>[];

      return Skeletonizer(
        enabled: isLoading,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 150.h,
                autoPlay: !isLoading && sliders.isNotEmpty,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: isLoading || sliders.isEmpty
                  ? [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          width: double.infinity,
                          height: 150.h,
                          color: Colors.grey,
                        ),
                      ),
                    ]
                  : sliders
                        .map(
                          (SliderImage slider) => ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              slider.image ?? '',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
            ),
            SizedBox(height: 12.h),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: isLoading || sliders.isEmpty ? 3 : sliders.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                dotHeight: 7,
                dotWidth: 7,
                spacing: 8,
              ),
            ),
          ],
        ),
      );
    },
  );
}
