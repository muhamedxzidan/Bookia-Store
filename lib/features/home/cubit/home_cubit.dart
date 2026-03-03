import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/slider_models.dart';
import 'package:bookia_store/features/home/data/repo/slider_repo.dart';
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
}
