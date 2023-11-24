import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/network/dio_options_network.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/app/config/app_config.dart';
import 'package:story_app/data/repositories/story_repository.dart';
import 'package:story_app/data/repositories/story_repository_impl.dart';

import 'auth_state.dart';

final authStateProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(ref.read(storyRepositoryProvider));
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final StoryRepository storyRepository;

  AuthStateNotifier(this.storyRepository) : super(const AuthState.initial());

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AuthState.signInLoading();

    try {
      final response = await Dio().post(
        "${ApiConfig.apiBaseUrl}/register",
        options: DioOptions.fetchDataOptions(),
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );

      state = AuthState.signUpSuccess(message: response.data["message"]);
    } on DioException catch (error) {
      state = AuthState.signUpError(
        httpStatus: error.response?.statusCode,
        message: error.message ?? "Uknown error",
      );
    }
  }

  Future<void> signInUser({required SignInPayload payload}) async {
    state = const AuthState.signInLoading();

    final result = await storyRepository.userSignIn(payload);

    result.fold(
      (error) => state = AuthState.signInError(
        httpStatus: error.httpStatus,
        message: error.message,
      ),
      (data) => state = AuthState.signInSuccess(response: data),
    );
  }
}
