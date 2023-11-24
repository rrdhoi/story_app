import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/app/shared/data_source_provider/shared_preferences_provider.dart';

import 'app/common/web_settings/url_strategy_other.dart';
import 'app/shared/state_logger.dart';
import 'package:story_app/app/config/flavor/app_flavor_config.dart';
import 'package:story_app/app/styles/app_theme.dart';

import 'app/routers/app_routers.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  usePathUrlStrategy();
  await EasyLocalization.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: const [StateLogger()],
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        path: 'assets/l10n',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppFlavorConfig.instance.color,
        brightness: themeMode,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: AppRouters.mainRouter.routeInformationParser,
      routerDelegate: AppRouters.mainRouter.routerDelegate,
      routeInformationProvider: AppRouters.mainRouter.routeInformationProvider,
    );
  }
}
