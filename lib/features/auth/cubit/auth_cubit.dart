import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bookia_store/features/auth/data/repo/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    try {
      final result = await AuthRepo.login(email: email, password: password);
      if (result) {
        emit(AuthLoginSuccessState());
      } else {
        emit(AuthLoginErrorState('Failed to login'));
      }
    } catch (e) {
      emit(AuthLoginErrorState(e.toString()));
    }
  }
}
