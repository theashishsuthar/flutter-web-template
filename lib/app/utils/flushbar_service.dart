import 'package:another_flushbar/flushbar.dart';

import 'package:another_flushbar/flushbar_route.dart' as route;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../app.export.dart';

/// The type of the message shown in the [Flushbar].
///
/// Determines the icon, color and duration of the [Flushbar].
enum FlushbarType {
  success,
  info,
  warning,
  error,
}

/// Uses the [Flushbar] package to display messages on the bottom of the
/// screen similar to a [SnackBar].
///
/// todo: when a flushbar is showing and navigator.pop() is called (i.e.
///   pressing the back button) it should pop the flushbar route first and
///   then call navigator.pop() again
/// todo: make sure 2 flushbars don't show at the sme time
class FlushbarService {
  static final Logger _log = Logger("Flushbar");

  void success(String message) => show(
        message: message,
        type: FlushbarType.success,
      );

  void info(String message) => show(
        message: message,
        type: FlushbarType.info,
      );

  void warning(String message) => show(
        message: message,
        type: FlushbarType.warning,
      );

  void error(String message) => show(
        message: message,
        type: FlushbarType.error,
      );

  /// Shows the [message] in a [Flushbar].
  ///
  /// If [child] is not `null`, it is used to build the message in the
  /// [Flushbar] instead and the [message] will be ignored.
  ///
  /// The [type] determines the icon and color.
  void show({
    String? message,
    Widget? child,
    FlushbarType type = FlushbarType.info,
  }) {
    _log.fine("showing flushbar message: $message");

    final navigator = NavigationUtilities.key.currentState!;

    final appTheme = AppTheme.of(navigator.context);

    Color? color;
    IconData? icon;
    Duration? duration;

    switch (type) {
      case FlushbarType.success:
        color = Colors.lightGreen;
        icon = Icons.error_outline;
        duration = const Duration(seconds: 6);
        break;
      case FlushbarType.info:
        color = Colors.blue;
        icon = Icons.info_outline;
        duration = const Duration(seconds: 3);
        break;
      case FlushbarType.warning:
        color = Colors.yellow;
        icon = Icons.error_outline;
        duration = const Duration(seconds: 6);
        break;
      case FlushbarType.error:
        color = Colors.red;
        icon = Icons.error_outline;
        duration = const Duration(seconds: 6);
        break;
    }

    final flushbar = Flushbar(
      backgroundColor: appTheme.backgroundColors!.first!,
      icon: Icon(icon, color: color),
      messageText:
          child ?? Text(message!, style: appTheme.theme.textTheme.subtitle1),
      duration: duration,
      leftBarIndicatorColor: color,
      animationDuration: const Duration(milliseconds: 600),
      forwardAnimationCurve: Curves.easeOutCirc,
    );

    navigator.push(route.showFlushbar(
      context: navigator.context,
      flushbar: flushbar,
    ));
  }
}
