import 'package:story_app/app/common/utils/type_deff_helper.dart';

class PayloadManager {
  static SignUpPayload signUp({
    required String name,
    required String email,
    required String password,
  }) =>
      {
        'name': name,
        'email': email,
        'password': password,
      };

  static SignUpPayload signIn({
    required String email,
    required String password,
  }) =>
      {
        'email': email,
        'password': password,
      };

  static DetailMapParam detailMapParam(DetailMapParam detailMapParam) =>
      detailMapParam;
}
