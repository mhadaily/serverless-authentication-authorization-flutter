import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mjcoffee/screens/home.dart';
import 'package:mjcoffee/services/chat_service.dart';
import 'package:mjcoffee/services/coffee_router.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'helpers/is_debug.dart';
import 'helpers/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(
    () async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: HomeScreen(),
          navigatorKey: CoffeeRouter.instance.navigatorKey,
          theme: getTheme(),
          builder: (context, child) {
            return StreamChat(
              child: child,
              client: ChatService.instance.client,
            );
          },
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
