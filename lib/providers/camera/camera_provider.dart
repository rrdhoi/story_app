import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'camera_state.dart';

final cameraProvider =
    StateNotifierProvider.autoDispose<CameraNotifier, CameraState>((
  ref,
) {
  return CameraNotifier(ref: ref);
});

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier({required this.ref}) : super(const CameraState.initial());

  CameraController? controller;
  bool _isCameraInitialized = false;
  bool isBackCameraSelected = false;
  final Ref ref;

  Future<void> initCamera(CameraDescription cameraDescription) async {
    state = const CameraState.loading();
    final previousCameraController = controller;
    final cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    await previousCameraController?.dispose();

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      state = CameraState.error("Error initializing camera: $e");
    }

    controller = cameraController;
    _isCameraInitialized = controller!.value.isInitialized;
    if (_isCameraInitialized) {
      state = CameraState.ready(controller!);
    } else {
      state = const CameraState.error("Not initialized");
    }
  }

  Future<void> onCameraTakePicture() async {
    if (state is CameraStateReady) {
      state = const CameraState.captureLoading();
      try {
        final imageFile = await controller?.takePicture();
        final imagePath = imageFile?.path;

        if (imagePath != null) {
          state = CameraState.captureSuccess(imageFile!);
        } else {
          state = const CameraState.error("Gagal mengambil path gambar");
        }
      } on CameraException catch (error) {
        state =
            CameraState.error("Gagal mengambil gambar : ${error.description}");
      }
    }
  }

  Future<void> onCameraSwitch(List<CameraDescription> cameras) async {
    await initCamera(cameras[isBackCameraSelected ? 1 : 0]);
  }

  void reset() async {
    await controller?.dispose();
  }

  @override
  void dispose() async {
    state = const CameraState.initial();
    await controller?.dispose();
    super.dispose();
  }
}
