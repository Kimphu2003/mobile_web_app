import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_web_app/core/router/route_names.dart';
import 'package:mobile_web_app/feature/audio/screens/audio_screen.dart';
import 'package:mobile_web_app/feature/home/screens/home_screen.dart';
import 'package:mobile_web_app/feature/keyboard/screens/keyboard_screen.dart';
import 'package:mobile_web_app/feature/location/screens/location_list_screen.dart';
import 'package:mobile_web_app/feature/map/screens/map_screen.dart';
import 'package:mobile_web_app/feature/landmark/screens/landmark_detail_screen.dart';

import '../../feature/location/screens/detail_location_list_screen.dart';
import '../../shell/main_shell.dart';


class AppRouter {
  static const String initialRoute = Routes.home;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialRoute,
      errorBuilder:
          (_, __) =>
      const Scaffold(body: Center(child: Text("Page not found"))),
      routes: [
        GoRoute(path: Routes.home, builder: (_, __) => const HomeScreen()),
        GoRoute(path: Routes.landmarkDetail, builder: (_, __) => const LandmarkDetailScreen()),

        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: Routes.audio,
          builder: (_, __) => const AudioScreen(),
        ),

        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => MainShell(child: child),
          routes: [
            GoRoute(
              path: '${Routes.shell}/${Routes.locationList}',
              builder: (_, __) => const LocationListScreen(),
              routes: [
                GoRoute(
                  path: Routes.locationDetail,
                  builder: (_, __) => const LocationDetailScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '${Routes.shell}/${Routes.keyboard}',
              builder: (_, __) => const KeyboardScreen(),
            ),
            GoRoute(
              path: '${Routes.shell}/${Routes.map}',
              builder: (_, __) => const MapScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
