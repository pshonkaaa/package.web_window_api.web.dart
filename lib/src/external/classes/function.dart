import 'dart:js_interop';
import 'dart:js_util';

import 'package:web_window_api/src/internal/self.dart';

extension JSFunctionExtension on JSFunction {
  // external dynamic call(
  //   dynamic thisArg, [
  //     dynamic arg1,
  //     dynamic arg2,
  //     dynamic arg3,
  //     dynamic arg4,
  //     dynamic arg5,
  //     dynamic arg6,
  //     dynamic arg7,
  //     dynamic arg8,
  //     dynamic arg9,
  // ]);

  dynamic call(List<dynamic> argsArray) {
    const hack = '__dart_hack';
    setProperty(jsWindow, hack, this);
    return callMethod(jsWindow, hack, argsArray);
  }

  external dynamic apply(dynamic thisArg, List<dynamic> argsArray);
}