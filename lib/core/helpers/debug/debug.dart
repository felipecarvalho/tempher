// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

enum LogType {
  info,
  warning,
  error,
  success,
}

class DebugMode {
  static void showOnLog(
    String message, {
    Type? className,
    LogType type = LogType.info,
  }) {
    late String emojiIcon;

    switch (type) {
      case LogType.info:
        message = 'Info: $message';
        emojiIcon = '🔵';
      case LogType.warning:
        message = 'Warning: $message';
        emojiIcon = '🟡';
      case LogType.error:
        message = 'Error: $message';
        emojiIcon = '🔴';
      case LogType.success:
        message = 'Success: $message';
        emojiIcon = '🟢';
      default:
    }

    final String handleString = className != null ? '$className => $message' : message;

    if (kDebugMode) {
      return debugPrint('$emojiIcon [APP] $handleString');
    } else {
      // A service like Sentry could be added here
    }
  }

  static void stayAwake() {
    if (kDebugMode) {
      showOnLog('Stay awake mode initialized', className: DebugMode);
      WakelockPlus.enable();
    }
  }
}
