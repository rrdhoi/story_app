// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:story_app/app/config/flavor/app_flavor_config.dart';
import 'package:story_app/app/config/flavor/app_flavor_type.dart';
import 'package:story_app/main_common.dart';

void main() {
  AppFlavorConfig(
    color: Colors.yellow,
    flavor: AppFlavorType.free,
  );

  mainCommon();
}
