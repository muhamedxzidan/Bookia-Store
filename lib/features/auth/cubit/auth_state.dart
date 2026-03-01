part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

//login states

final class AuthInitial extends AuthState {}

final class AuthLoginSuccessState extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginErrorState extends AuthState {
  AuthLoginErrorState(this.error);
  final String error;
}
//register states

final class AuthRegisterSuccessState extends AuthState {}

final class AuthRegisterLoadingState extends AuthState {}

final class AuthRegisterErrorState extends AuthState {
  AuthRegisterErrorState(this.error);
  final String error;
}
