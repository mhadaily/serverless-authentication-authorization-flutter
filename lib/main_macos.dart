import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mjcoffee/screens/home.dart';
import 'package:mjcoffee/screens/menu.dart';
import 'package:mjcoffee/screens/menu_detail.dart';

import 'helpers/constants.dart';
import 'helpers/is_debug.dart';
import 'helpers/theme.dart';
import 'models/coffee.dart';
import 'screens/home_desktop.dart';

class LoginInfo extends ChangeNotifier {
  var _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

final loginInfo = LoginInfo();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Login'),
          onPressed: () {
            loginInfo.isLoggedIn = true;
          },
        ),
      ),
    );
  }
}

Future<void> main() async {
  final router = GoRouter(
    // redirect: (GoRouterState state) {
    //   final loggedIn = loginInfo.isLoggedIn;

    //   final isLogging = state.location == '/login';

    //   if (!loggedIn && !isLogging) return '/login';

    //   if (loggedIn && isLogging) return '/';

    //   return null;
    // },
    refreshListenable: loginInfo,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: HomeDesktopScreen(),
        ),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        name: 'menu',
        path: '/menu',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: MenuScreen(),
        ),
        routes: [
          GoRoute(
            name: 'details',
            path: ':id', // e.g. /menu/1002
            pageBuilder: (context, state) {
              final coffee = _coffeeFrom(state.params['id']!);
              return MaterialPage(
                key: state.pageKey,
                child: MenuDetails(coffee: coffee),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(
    () async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(
        MacosApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          // theme: getTheme(),
        ),
      );
    },
    (error, stackTrace) async {
      print('Caught Dart Error!');
      print('$error');
      print('$stackTrace');
    },
  );

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    final dynamic exception = details.exception;
    final StackTrace? stackTrace = details.stack;
    if (isInDebugMode) {
      print('Caught Framework Error!');
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone
      Zone.current.handleUncaughtError(exception, stackTrace!);
    }
  };
}

Coffee _coffeeFrom(String s) {
  return coffees.where((coffee) => coffee.id.toString() == s).first;
}
