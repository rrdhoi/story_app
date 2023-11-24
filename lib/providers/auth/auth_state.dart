import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/user_model/sign_in_response.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;

  const factory AuthState.signInLoading() = SignInStateLoading;
  const factory AuthState.signInSuccess({required SignInResponse response}) =
      SignInStateSuccess;
  const factory AuthState.signInError({int? httpStatus, String? message}) =
      SignInStateError;

  const factory AuthState.signUpLoading() = SignUpStateLoading;
  const factory AuthState.signUpSuccess({required String message}) =
      SignUpStateSuccess;
  const factory AuthState.signUpError({int? httpStatus, String? message}) =
      SignUpStateError;
}
