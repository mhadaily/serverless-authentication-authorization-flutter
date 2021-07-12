import 'package:flutter/material.dart';

/// Handles everything related to routing and routes.
///
/// In order to add a new route to the app, you first have to add
/// the route to the [router.dart] file. You then have to
/// add the route to the switch statement
/// in the [routes] function below.
class CoffeeRouter {
  // Singleton setup: prevents multiple instances of this class.
  factory CoffeeRouter() => _router;

  CoffeeRouter._();

  static final CoffeeRouter _router = CoffeeRouter._();

  static CoffeeRouter get instance => _router;

  /// Key so we can navigate without context.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object>(Route<T> route) async {
    return navigatorKey.currentState!.push(route);
  }

  Future<T?> pushReplacement<T extends Object>(Route<T> route) async {
    return navigatorKey.currentState!.pushReplacement(route);
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
    Route<T> route, {
    String? untilRoute,
  }) async {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      route,
      (Route<dynamic> _route) {
        return untilRoute == _route.settings.name;
      },
    );
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String route) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(route));
  }

  /// Page route builder with forced fade in / out transition.
  static PageRouteBuilder<Widget> fadeTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Page route builder with forced slide in from top
  static PageRouteBuilder<Widget> fromTopTransition(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return PageRouteBuilder<Widget>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
