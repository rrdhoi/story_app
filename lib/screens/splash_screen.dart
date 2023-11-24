import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/config/flavor/app_flavor_config.dart';
import 'package:story_app/app/config/flavor/app_flavor_type.dart';
import 'package:story_app/app/routers/app_routers.dart';
import 'package:story_app/app/routers/named_routes.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';

import '../app/shared/authenticated_provider/app_auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenerAuthState(ref, context);
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                size: 120,
                Icons.menu_book,
                color: context.colorScheme.primary,
              ),
              Text(
                (AppFlavorConfig.instance.flavor == AppFlavorType.free)
                    ? LocaleKeys.freeVersion.tr()
                    : LocaleKeys.paidVersion.tr(),
                style: context.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenerAuthState(WidgetRef ref, BuildContext context) async {
    final isAuthenticated = ref.read(appAuthProvider);

    Timer(const Duration(seconds: 2), () async {
      if (isAuthenticated != null) {
        AppRouters.mainRouter.goNamed(NamedRoutes.home.name);
      } else {
        AppRouters.mainRouter.goNamed(NamedRoutes.signIn.name);
      }
    });
  }
}
