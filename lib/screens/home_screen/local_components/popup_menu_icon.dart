import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/constants/app_locale.dart';
import 'package:story_app/app/shared/authenticated_provider/app_auth_provider.dart';
import 'package:story_app/app/styles/app_theme.dart';
import 'package:story_app/widgets/icon_button_theme.dart';
import 'package:story_app/widgets/icon_button_translate.dart';

import '../../../app/routers/named_routes.dart';
import '../../../widgets/icon_button_logout.dart';

class PopupMenuHome extends ConsumerWidget {
  const PopupMenuHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      offset: const Offset(-10, kToolbarHeight),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 1,
            child: BuildIconButtonTheme(isPopup: true),
          ),
          const PopupMenuItem(
            value: 2,
            child: BuildIconButtonLogout(isPopup: true),
          ),
        ];
      },
      onSelected: (value) async {
        if (value == 1) {
          await ref.read(appThemeProvider.notifier).toggleTheme();
        } else if (value == 2) {
          await ref.read(appAuthProvider.notifier).logout();
          context.goNamed(NamedRoutes.signIn.name);
        }
      },
    );
  }
}

class PopupMenuLocale extends StatelessWidget {
  const PopupMenuLocale({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(-10, kToolbarHeight),
      icon: const Icon(Icons.language_outlined),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 2,
            child: BuildIconButtonLocale(
              "English",
              "EN",
              isPopup: true,
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: BuildIconButtonLocale(
              "Indonesia",
              "ID",
              isPopup: true,
            ),
          ),
        ];
      },
      onSelected: (value) async {
        if (value == 1) {
          await context.setLocale(const Locale('id'));
        } else if (value == 2) {
          await context.setLocale(AppLocale.defaultLocale);
        }
      },
    );
  }
}
