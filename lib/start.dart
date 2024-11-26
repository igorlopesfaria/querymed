import 'dart:io';

import 'package:appdoctorline/router/base_router.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  StartWidget({super.key});

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<StartWidget> createState() => _StartWidget();
}

class _StartWidget extends State<StartWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaler
              .clamp(minScaleFactor: 1.0, maxScaleFactor: 1.5);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: scale),
            child: child!,
          );
        },
        navigatorKey: CommonNavigator.key,
        debugShowCheckedModeBanner: false,
        onGenerateInitialRoutes: Platform.isIOS ?  BaseRouter().onGenerateInitialRoutes : null,
        initialRoute: CommonRoutes.onboardingSplashRoute,
        onGenerateRoute: BaseRouter().onGenerateRoute);
  }
}
