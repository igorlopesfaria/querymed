import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonNavigator {
  CommonNavigator._();

  static final key = GlobalKey<NavigatorState>();

  static BuildContext get currentContext => key.currentContext!;

  static Future<T?> push<T>(BuildContext context, Widget page, [String? routeName]) {
    return Navigator.push(
      context,
      getPageRoute(view: page, routeName: routeName),
    );
  }

  static Future<T?> pushNamed<T>(
      BuildContext context,
      String route, {
        arguments,
      }) {
    return Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  static Future<T?> pushReplacement<T>(BuildContext context, Widget page,
      [String? routeName]) {
    return Navigator.pushReplacement(
      context,
      getPageRoute(view: page, routeName: routeName),
    );
  }

  static Future<T?> pushReplacementNamed<T>(
      BuildContext context,
      String route, {
        arguments,
      }) {
    return Navigator.pushReplacementNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  static Future<T?> pushAndClear<T>(BuildContext context, Widget page,
      [String? routeName]) {
    return Navigator.pushAndRemoveUntil(
      context,
      getPageRoute(view: page, routeName: routeName),
          (route) => false,
    );
  }

  static Future<T?> pushNamedAndClear<T>(
      BuildContext context,
      String route, {
        arguments,
      }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      route,
          (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }

  static void maybePop<T>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }

  static bool canPop(BuildContext context) => Navigator.canPop(context);

  static void popUntilRoute(BuildContext context, String routeName) {
    return Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static PageRoute<T> getPageRoute<T>(
      {required Widget view, required String? routeName}) {
    final nameOfRoute = routeName ?? view.runtimeType.toString();
    if (Platform.isIOS) {
      return CupertinoPageRoute<T>(
        builder: (_) => view,
        settings: RouteSettings(name: nameOfRoute),
      );
    } else {
      return MaterialPageRoute<T>(
        builder: (_) => view,
        settings: RouteSettings(name: nameOfRoute),
      );
    }
  }
}
