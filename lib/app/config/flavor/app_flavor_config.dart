import 'package:flutter/material.dart';
import 'package:story_app/app/config/flavor/app_flavor_type.dart';

class AppFlavorConfig {
  final AppFlavorType flavor;
  final MaterialColor color;

  static AppFlavorConfig? _instance;

  AppFlavorConfig({
    this.flavor = AppFlavorType.free,
    this.color = Colors.yellow,
  }) {
    _instance = this;
  }

  static AppFlavorConfig get instance => _instance ?? AppFlavorConfig();
}
