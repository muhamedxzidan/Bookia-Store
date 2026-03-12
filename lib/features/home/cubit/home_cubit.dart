import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/home/data/models/slider_models.dart';
import 'package:bookia_store/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<SliderImage> _sliders = [];
  List<BookProduct> _bestSellers = [];

  Future<void> getSliders() async {
    emit(HomeLoading());
    final response = await HomeRepo.getHomeSliders();
    if (response is SliderModel) {
      _sliders = response.data?.sliders ?? [];
      emit(HomeLoaded(sliders: _sliders, bestSellers: _bestSellers));
    } else {
      emit(HomeError(message: 'Failed to load sliders'));
    }
  }

  Future<void> getBestSellers() async {
    emit(HomeLoading());
    final response = await HomeRepo.getBestSellers();
    if (response is BestSellerModel) {
      _bestSellers = response.data?.products ?? [];
      emit(HomeLoaded(sliders: _sliders, bestSellers: _bestSellers));
    } else {
      emit(HomeError(message: 'Failed to load best sellers'));
    }
  }
}
