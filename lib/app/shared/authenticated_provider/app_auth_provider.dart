import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';
import '../data_source_provider/shared_preferences_provider.dart';

final appAuthProvider = StateNotifierProvider<AuthNotifier, String?>(
  (ref) => AuthNotifier(
    ref.read(sharedPreferencesProvider),
  ),
);

class AuthNotifier extends StateNotifier<String?> {
  final SharedPreferences? sharedPreferences;

  AuthNotifier(this.sharedPreferences) : super(null) {
    isAuthenticated();
  }

  Future<void> logout() async {
    await sharedPreferences?.remove(AppConstants.appAuthenticate);
    state = null;
  }

  Future<void> login(String token) async {
    await sharedPreferences?.setString(
      AppConstants.appAuthenticate,
      token,
    );
    isAuthenticated();
  }

  void isAuthenticated() {
    final isLoggedIn =
        sharedPreferences?.getString(AppConstants.appAuthenticate);
    state = isLoggedIn;
  }
}
