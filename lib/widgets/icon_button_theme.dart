import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';

import '../app/styles/app_theme.dart';

class BuildIconButtonTheme extends HookConsumerWidget {
  const BuildIconButtonTheme({super.key, this.isPopup = false});

  final bool isPopup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState =
        ref.watch(appThemeProvider.select((value) => value.name));

    return GestureDetector(
      onTap: () async {
        if (isPopup) {
          await ref.read(appThemeProvider.notifier).toggleTheme();
        }
      },
      child: Row(
        children: [
          Icon(
            appThemeState == "dark" ? Icons.brightness_2 : Icons.brightness_7,
          ),
          const SizedBox(width: 8),
          Text(
            appThemeState == "dark"
                ? LocaleKeys.dark.tr()
                : LocaleKeys.light.tr(),
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
