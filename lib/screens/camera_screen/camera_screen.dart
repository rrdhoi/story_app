import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

import '../../app/shared/l10n/locale_keys.g.dart';
import '../../providers/camera/camera_provider.dart';
import '../../providers/camera/camera_state.dart';

class CameraScreen extends HookConsumerWidget with WidgetsBindingObserver {
  const CameraScreen({super.key, required this.cameraDescriptions});

  final List<CameraDescription> cameraDescriptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraNotifier = ref.read(cameraProvider.notifier);
    final cameraState = ref.watch(cameraProvider);

    useOnAppLifecycleStateChange((previous, current) {
      if (cameraNotifier.controller != null &&
          cameraNotifier.controller!.value.isInitialized) {
        switch (current) {
          case AppLifecycleState.inactive:
            Future.microtask(() async => cameraNotifier.reset());
            break;
          case AppLifecycleState.resumed:
            Future(
              () => cameraNotifier.initCamera(cameraDescriptions.first),
            );
            break;
          default:
            break;
        }
      }
    });

    useEffect(
      () {
        WidgetsBinding.instance.addObserver(this);
        Future(
          () => cameraNotifier.initCamera(cameraDescriptions.first),
        );
        return () {
          WidgetsBinding.instance.removeObserver(this);
          cameraNotifier.reset();
        };
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.takeAPicture.tr()),
        actions: [
          IconButton(
            onPressed: () async {
              cameraNotifier.isBackCameraSelected =
                  !cameraNotifier.isBackCameraSelected;

              await cameraNotifier.onCameraSwitch(cameraDescriptions);
            },
            icon: const Icon(Icons.cameraswitch),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: switch (cameraState) {
              CameraStateInitial() ||
              CameraStateLoading() ||
              CameraStateCaptureLoading() =>
                CircularProgressIndicator(
                  color: context.colorScheme.primary,
                ),
              CameraStateReady() =>
                SizedBox.expand(child: CameraPreview(cameraState.controller)),
              CameraStateError() ||
              CameraStateCaptureError() =>
                SizedBox.expand(
                  child: Text(
                    LocaleKeys.errorMessage.tr(),
                  ),
                ),
              _ => null,
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 48),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: FloatingActionButton(
                heroTag: "take-picture",
                tooltip: LocaleKeys.takeAPicture.tr(),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () async {
                  await cameraNotifier.onCameraTakePicture();
                  final state = ref.watch(cameraProvider);

                  if (state is CameraStateCaptureSuccess) {
                    context.pop(state.imgFile);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
