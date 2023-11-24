import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

import 'custom_button.dart';

extension DialogExtension on BuildContext {
  Future<void> showCustomDialog({
    required String title,
    required String message,
    required String primaryText,
    String? image,
    Widget? descriptionWidget,
    String secondaryText = '-',
    VoidCallback? onPrimaryPressedMulti,
    VoidCallback? onSecondaryPressedMulti,
    bool isBarrierDisable = false,
  }) {
    return showDialog(
      context: this,
      barrierDismissible: isBarrierDisable,
      builder: (context) => CustomDialogBox(
        title: title,
        description: message,
        primaryText: primaryText,
        secondaryText: secondaryText,
        img: image,
        descriptionWidget: descriptionWidget,
        onPrimaryPressedMulti: onPrimaryPressedMulti,
        onSecondaryPressedMulti: onSecondaryPressedMulti,
      ),
    );
  }

  Future<void> showLoadingPopup(String message) async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => LoadingPopup(message: message),
    );
  }

  void hideLoadingPopup() => pop();
}

class DialogManager {
  static AlertDialog createAlertDialog({
    required Widget content,
    required List<Widget> actions,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      content: content,
      actions: actions,
    );
  }
}

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({
    super.key,
    required this.title,
    required this.description,
    required this.primaryText,
    required this.img,
    this.secondaryText = '-',
    this.onPrimaryPressedMulti,
    this.descriptionWidget,
    this.onSecondaryPressedMulti,
  });

  final String title, description, primaryText;
  final VoidCallback? onPrimaryPressedMulti;
  final VoidCallback? onSecondaryPressedMulti;
  final String? img;
  final Widget? descriptionWidget;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: 0,
      backgroundColor: context.colorScheme.onInverseSurface,
      child: contentBox(context),
    );
  }

  Container contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        top: img != null ? 65 : 24,
        right: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: context.textTheme.headlineSmall
                ?.copyWith(color: context.colorScheme.onSurface),
          ),
          const SizedBox(height: 15),
          descriptionWidget ??
              Text(
                description,
                textAlign: TextAlign.left,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onSecondaryPressedMulti != null)
                CustomButton(
                  title: secondaryText,
                  onPressed: onSecondaryPressedMulti,
                ),
              const SizedBox(width: 7.5),
              CustomButton(
                title: primaryText,
                onPressed: onPrimaryPressedMulti,
                borderRadius: BorderRadius.circular(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: context.colorScheme.primary,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                message,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
