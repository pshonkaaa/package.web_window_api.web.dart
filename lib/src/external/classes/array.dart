import 'dart:js_interop';
import 'dart:js_util';

extension JSArrayExtension on JSArray {
  void push(dynamic element) {
    callMethod(this, 'push', [element]);
  }
}