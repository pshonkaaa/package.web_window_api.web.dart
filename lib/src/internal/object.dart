import 'dart:js_interop';

import 'package:web_window_api/src/external/functions.dart';

@JS('Object')
class InternalJSObject {
  static JSObject defineProperty(JSObject object, Object prop, JSObjectDescriptor descriptor) {
    return _defineProperty(object, prop, descriptor.jsify());
  }

  @JS('defineProperty')
  external static JSObject _defineProperty(dynamic object, dynamic prop, dynamic descriptor);
}