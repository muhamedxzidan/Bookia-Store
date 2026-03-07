import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/home/data/models/slider_models.dart';
import 'package:bookia_store/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getSliders() async {
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSliders();
    if (response is SliderModel) {
      emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
    } else {
      emit(GetHomeSliderError());
    }
  }

  Future<void> getBestSellers() async {
    emit(GetBestSellerLoading());
    final response = await HomeRepo.getBestSellers();
    if (response is BestSellerModel) {
      emit(GetBestSellerSuccess((response.data?.products ?? [])));
    } else {
      emit(GetBestSellerError());
    }
  }
}
