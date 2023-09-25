import 'dart:js';
import 'dart:js_interop';
import 'dart:js_util';

import 'dart:js_util' as js;

import 'package:web_window_api/src/internal/object.dart';

import 'classes/promise.dart';

JSObject defineProperty(JSObject object, Object prop, JSObjectDescriptor descriptor) {
  return InternalJSObject.defineProperty(object, prop, descriptor);
}

Promise futureToPromise<T>(Future<T> future) {
  return Promise(allowInterop((Function resolve, Function reject) {
    future.then((result) => resolve(result), onError: reject);
  }));
}

class JSObjectDescriptor {
  final bool? configurable;
  final bool? enumerable;
  final dynamic value;
  final bool? writable;
  final Function? get;
  final Function? set;
  const JSObjectDescriptor({
    this.configurable,
    this.enumerable,
    this.value = Null,
    this.writable,
    this.get,
    this.set,
  });

  dynamic jsify() {
    final result = js.jsify({
      if(configurable != null)
        'configurable': configurable,
      if(enumerable != null)
        'enumerable': enumerable,
      // if(value != Null)
      //   'value': value,
      if(writable != null)
        'writable': writable,
      if(get != null)
        'get': allowInterop(get!),
      if(set != null)
        'set': allowInterop(set!),
    });

    //because of Symbol(react.fragment)?
    if(value != Null)
      setProperty(result, 'value', value);
    return result;
  }
}