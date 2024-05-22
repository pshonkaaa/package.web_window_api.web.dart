import 'dart:async';
import 'dart:html';

class DocumentApi {

  static Future<void> waitForDocumentReady() async {
    if(document.readyState != 'complete') {
      final completer = Completer();
      window.addEventListener('load', (_) => completer.complete());
      return await completer.future;
    }
  }
}