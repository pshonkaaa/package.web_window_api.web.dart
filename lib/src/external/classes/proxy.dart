import 'dart:js';
import 'dart:js_interop';

import 'package:js/js.dart' as js;
import 'dart:js_util' as js;

typedef OnApplyProxy<T> = T Function(JSFunction target, dynamic thisArg, List<dynamic> arguments);
typedef OnConstructProxy = JSObject Function(JSObject target, List<dynamic> arguments, JSObject newTarget);
typedef OnDefinePropertyProxy = bool Function(JSObject target, dynamic property, JSObject descriptor);
typedef OnDeletePropertyProxy = bool Function(JSObject target, dynamic property);
typedef OnGetProxy = dynamic Function(JSObject target, dynamic property, dynamic receiver);
typedef OnSetProxy = bool Function(JSObject target, Object property, dynamic value, dynamic receiver);

@js.JS()
class Proxy {
  factory Proxy(JSObject object, ProxyHandler handler)
    => Proxy._Proxy(object, handler.jsify());
  
  static ProxyRevocable revocable(JSObject object, ProxyHandler handler) {
    return _revocable(object, handler.jsify()) as ProxyRevocable;
  }

  @JS('Proxy')
  external Proxy._Proxy(dynamic object, dynamic handler);

  @JS('revocable')
  external static JSObject _revocable(dynamic object, dynamic handler);
}

@js.JS()
class ProxyRevocable {
  external Proxy proxy;
  external void revoke();
}

class ProxyHandler {
  final OnApplyProxy? apply;
  final OnConstructProxy? construct;
  final OnDefinePropertyProxy? defineProperty;
  final OnDeletePropertyProxy? deleteProperty;
  final OnGetProxy? get;
  final OnSetProxy? set;
  const ProxyHandler({
    this.apply,
    this.construct,
    this.defineProperty,
    this.deleteProperty,
    this.get,
    // this.getOwnPropertyDescriptor,
    // this.getPrototypeOf,
    // this.has,
    // this.isExtensible,
    // this.ownKeys,
    // this.preventExtensions,
    this.set,
    // this.setPrototypeOf,
  });

  dynamic jsify() {
    return js.jsify({
      if(apply != null)
        'apply': allowInterop(apply!),
      if(construct != null)
        'construct': allowInterop(construct!),
      if(defineProperty != null)
        'defineProperty': allowInterop(defineProperty!),
      if(deleteProperty != null)
        'deleteProperty': allowInterop(deleteProperty!),
      if(get != null)
        'get': allowInterop(get!),
      if(set != null)
        'set': allowInterop(set!),
    });
  }
}