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
    String? method,
    LogType type = LogType.info,
  }) {
    late String emojiIcon;
    late String stringType;

    switch (type) {
      case LogType.info:
        stringType = 'Info:';
        emojiIcon = '🔵';
      case LogType.warning:
        stringType = 'Warning:';
        emojiIcon = '🟡';
      case LogType.error:
        stringType = 'Error:';
        emojiIcon = '🔴';
      case LogType.success:
        stringType = 'Success:';
        emojiIcon = '🟢';
      default:
    }

    final String handleString =
        '${className != null ? '=> $className' : ''} $stringType $message ${method != null ? '=> $method' : ''}';

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
