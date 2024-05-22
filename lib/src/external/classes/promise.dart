import 'dart:js_interop';
import 'dart:js_util';

@JS()
class Promise<T> {
  external Promise(void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}

extension PromiseEx<T> on Promise<T> {
  Future<T> asFuture()
    => promiseToFuture<T>(this);
}