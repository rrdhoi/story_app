import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

import '../app/shared/l10n/locale_keys.g.dart';

class BuildIconButtonLogout extends HookConsumerWidget {
  const BuildIconButtonLogout({super.key, this.isPopup = false});

  final bool isPopup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(Icons.logout_rounded),
        const SizedBox(width: 8),
        Text(LocaleKeys.logout.tr(), style: context.textTheme.bodyLarge),
      ],
    );
  }
}
