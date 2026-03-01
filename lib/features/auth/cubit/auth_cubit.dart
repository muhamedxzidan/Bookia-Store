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

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String address,
    required String city,
  }) async {
    emit(AuthRegisterLoadingState());
    try {
      final result = await AuthRepo.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        address: address,
        city: city,
      );
      if (result) {
        emit(AuthRegisterSuccessState());
      } else {
        emit(AuthRegisterErrorState('Failed to register'));
      }
    } catch (e) {
      emit(AuthRegisterErrorState(e.toString()));
    }
  }
}
