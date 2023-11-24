import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/widgets/custom_button.dart';

class PlaceMarkWidget extends HookConsumerWidget {
  const PlaceMarkWidget({
    super.key,
    required this.placeMark,
    required this.onSelected,
    this.isViewOnly = false,
  });

  final Placemark? placeMark;
  final VoidCallback onSelected;
  final bool isViewOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: context.colorScheme.onInverseSurface,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  (placeMark != null) ? placeMark!.street ?? '-' : "-",
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  (placeMark != null)
                      ? '${placeMark!.subLocality}, ${placeMark!.locality}, ${placeMark!.country}'
                      : '-',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                if (isViewOnly == false)
                  CustomButton(
                    title: LocaleKeys.selectLocation.tr(),
                    onPressed: onSelected,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
