import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_web_app/core/router/app_router.dart';
import 'package:mobile_web_app/core/utils/my_scroll_behavior.dart';

class PhoneApp extends StatelessWidget {
  PhoneApp({super.key});

  final GoRouter goRouter = AppRouter.createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      scrollBehavior: MyScrollBehavior(),
    );
  }
}