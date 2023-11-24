import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/common/utils/transition_animations.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/screens/camera_screen/camera_screen.dart';
import 'package:story_app/screens/create_story_screen/story_map/story_map_screen.dart';
import 'package:story_app/screens/splash_screen.dart';

import '../../screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import '../../screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import '../../screens/create_story_screen/create_story_screen.dart';
import '../../screens/detail_story_screen/detail_story_screen.dart';
import '../../screens/error_screen/not_found_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import 'named_routes.dart';

class AppRouters {
  static final _mainNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter mainRouter = GoRouter(
    initialLocation: NamedRoutes.splash.path,
    navigatorKey: _mainNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      onSplashScreen,
      onSignInRouter,
      onSignUpRouter,
      onHomeRoute,
      onCreateStoryScreen,
    ],
    errorBuilder: (_, state) => const NotFoundScreen(),
  );

  static GoRoute onSignInRouter = GoRoute(
    name: NamedRoutes.signIn.name,
    path: NamedRoutes.signIn.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const SignInScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  );

  static GoRoute onSignUpRouter = GoRoute(
    name: NamedRoutes.signUp.name,
    path: NamedRoutes.signUp.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const SignUpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  );

  static GoRoute onHomeRoute = GoRoute(
    name: NamedRoutes.home.name,
    path: NamedRoutes.home.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc)
                .animate(RailAnimation(parent: animation)),
            child: child,
          );
        },
      );
    },
    routes: [
      GoRoute(
        name: NamedRoutes.detailStory.name,
        path: NamedRoutes.detailStory.path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailStoryScreen(id: state.pathParameters['id']!),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: NamedRoutes.storyDetailMap.path,
            name: NamedRoutes.storyDetailMap.name,
            builder: (context, state) {
              final data = (state.extra as DetailMapParam);
              return StoryMapScreen(
                key: state.pageKey,
                isViewOnly: data.isViewOnly,
                position: data.latLng,
              );
            },
          ),
        ],
        redirect: (context, state) {
          if (state.pathParameters['id'] == null) {
            return NamedRoutes.home.path;
          }

          return null;
        },
      ),
    ],
  );

  static GoRoute onSplashScreen = GoRoute(
    name: NamedRoutes.splash.name,
    path: NamedRoutes.splash.path,
    builder: (context, state) => const SplashScreen(),
  );

  static GoRoute onCreateStoryScreen = GoRoute(
    name: NamedRoutes.createStory.name,
    path: NamedRoutes.createStory.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const CreateStoryScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    routes: [
      onCameraScreen,
      onStoryMapScreen,
    ],
  );

  static GoRoute onCameraScreen = GoRoute(
    path: NamedRoutes.camera.path,
    name: NamedRoutes.camera.name,
    builder: (context, state) => CameraScreen(
      cameraDescriptions: state.extra as List<CameraDescription>,
    ),
  );

  static GoRoute onStoryMapScreen = GoRoute(
    path: NamedRoutes.storyMap.path,
    name: NamedRoutes.storyMap.name,
    builder: (context, state) {
      final data = (state.extra as DetailMapParam);
      return StoryMapScreen(
        isViewOnly: data.isViewOnly,
        position: data.latLng,
      );
    },
  );
}
