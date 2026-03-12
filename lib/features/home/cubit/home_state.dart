part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  HomeLoaded({
    required this.sliders,
    required this.bestSellers,
  });

  final List<SliderImage> sliders;
  final List<BookProduct> bestSellers;

  HomeLoaded copyWith({
    List<SliderImage>? sliders,
    List<BookProduct>? bestSellers,
  }) =>
      HomeLoaded(
        sliders: sliders ?? this.sliders,
        bestSellers: bestSellers ?? this.bestSellers,
      );
}

final class HomeError extends HomeState {
  HomeError({required this.message});
  final String message;
}
