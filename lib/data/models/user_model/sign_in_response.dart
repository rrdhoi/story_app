import 'package:story_app/data/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';

part 'sign_in_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    required bool error,
    required String message,
    @JsonKey(name: "loginResult") required UserModel? data,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, Object?> json) =>
      _$SignInResponseFromJson(json);
}
