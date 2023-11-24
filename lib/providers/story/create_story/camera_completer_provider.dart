import 'dart:async';

import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final cameraCompleterProvider =
    Provider.autoDispose<Completer<XFile?>>((ref) => Completer<XFile?>());
