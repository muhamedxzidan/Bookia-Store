import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/profile/data/models/profile_model.dart';
import 'package:bookia_store/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final response = await ProfileRepo.getProfile();
    final user = response?.data?.user;
    if (user == null) {
      emit(ProfileError(message: 'Failed to load profile'));
      return;
    }
    emit(ProfileLoaded(user: user));
  }

  Future<void> logout() async {
    await ProfileRepo.clearToken();
    emit(ProfileLoggedOut());
  }
}