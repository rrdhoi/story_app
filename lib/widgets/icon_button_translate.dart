import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

class BuildIconButtonLocale extends HookConsumerWidget {
  const BuildIconButtonLocale(
    this.language,
    this.countryFlag, {
    super.key,
    this.isPopup = false,
  });

  final bool isPopup;
  final String language;
  final String countryFlag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(countryFlag, style: context.textTheme.bodyLarge),
        const SizedBox(width: 8),
        Text(language, style: context.textTheme.bodyLarge),
      ],
    );
  }
}
