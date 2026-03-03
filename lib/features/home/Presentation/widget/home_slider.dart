import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/features/home/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    builder: (context, state) {
      if (state is GetHomeSliderLoading) {
        return const CircularProgressIndicator();
      } else if (state is GetHomeSliderSuccess) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,

                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: state.sliders
                  .map(
                    (slider) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          state.sliders[_currentIndex].image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 12.h),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: state.sliders.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
              ),
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    },
  );
}
