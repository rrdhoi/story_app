import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_state.freezed.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.initial() = CameraStateInitial;
  const factory CameraState.loading() = CameraStateLoading;
  const factory CameraState.error(String message) = CameraStateError;
  const factory CameraState.ready(CameraController controller) =
      CameraStateReady;

  const factory CameraState.captureLoading() = CameraStateCaptureLoading;
  const factory CameraState.captureError(String message) =
      CameraStateCaptureError;
  const factory CameraState.captureSuccess(XFile imgFile) =
      CameraStateCaptureSuccess;
}
