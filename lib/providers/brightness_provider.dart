import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/app/constants/app_constants.dart';

enum BrightnessMode { dark, light }

class ServicesProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  BrightnessMode _brightnessMode = BrightnessMode.light;

  ServicesProvider({required this.sharedPreferences}) {
    Future.microtask(() async => _loadBrightnessMode());
  }

  BrightnessMode get brightnessMode => _brightnessMode;

  Future<void> _loadBrightnessMode() async {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final bool isDarkMode = sharedPreferences.getBool(AppConstants.brightnessMode) ??
        brightness == Brightness.dark;
    _brightnessMode = isDarkMode ? BrightnessMode.dark : BrightnessMode.light;
    notifyListeners();
  }

  Future<void> setBrightnessMode(BrightnessMode mode) async {
    final bool isDarkMode = mode == BrightnessMode.dark;
    await sharedPreferences.setBool(AppConstants.brightnessMode, isDarkMode);
    _brightnessMode = mode;
    notifyListeners();
  }
}
