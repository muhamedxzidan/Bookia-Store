part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderError extends HomeState {}

final class GetHomeSliderSuccess extends HomeState {
  GetHomeSliderSuccess(this.sliders);
  final List<SliderItem> sliders;
}

final class GetHomeSliderLoading extends HomeState {}
