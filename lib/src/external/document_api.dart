import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart';

class DocumentApi {

  static Future<void> waitForDocumentReady() async {
    if(document.readyState != 'complete') {
      final completer = Completer();
      window.addEventListener('load', ((_) => completer.complete()).toJS);
      return await completer.future;
    }
  }
}