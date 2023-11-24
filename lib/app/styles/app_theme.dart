import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/app/constants/app_constants.dart';
import 'package:story_app/app/shared/data_source_provider/shared_preferences_provider.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeModeNotifier, Brightness>(
  (ref) {
    final sharedPref = ref.watch(sharedPreferencesProvider);
    return AppThemeModeNotifier(sharedPref);
  },
);

class AppThemeModeNotifier extends StateNotifier<Brightness> {
  final SharedPreferences? sharedPreferences;

  AppThemeModeNotifier(this.sharedPreferences) : super(Brightness.light) {
    getCurrentTheme();
  }

  Future<void> toggleTheme() async {
    state = state == Brightness.dark ? Brightness.light : Brightness.dark;
    await sharedPreferences?.setBool(
      AppConstants.appThemeKey,
      state == Brightness.dark ? true : false,
    );
  }

  void getCurrentTheme() {
    final isDark =
        sharedPreferences?.getBool(AppConstants.appThemeKey) ?? false;
    final value = isDark ? Brightness.dark : Brightness.light;
    state = value;
  }
}
