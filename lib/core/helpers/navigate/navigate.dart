import 'package:flutter_modular/flutter_modular.dart';
import 'package:tempher/core/helpers/helpers.dart';

class Navigate {
  static void _showPrint(path, arguments) {
    String print = arguments == null ? 'Navigate to $path' : 'Navigate to $path with arguments $arguments';
    DebugMode.showOnLog(print, className: Navigate, type: LogType.warning);
  }

  static push(String path, {dynamic arguments}) {
    _showPrint(path, arguments);
    return Modular.to.pushNamed(path, arguments: arguments);
  }

  static pushWithoutPop(String path, {dynamic arguments}) {
    _showPrint(path, arguments);
    return Modular.to.navigate(path, arguments: arguments);
  }

  static pop() {
    String path = Modular.to.path;
    DebugMode.showOnLog('Returned from $path', className: Navigate, type: LogType.warning);
    return Modular.to.pop();
  }
}
