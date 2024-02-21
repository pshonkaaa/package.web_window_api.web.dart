// import 'dart:html';
// import 'dart:js';
// import 'dart:js_interop';

// import 'package:js/js.dart' as js;
// import 'dart:js_util' as js;

// typedef OnMutation<T> = T Function(List<MutationRecord> records, MutationObserver observer);
  
// @js.JS()
// // https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver
// class MutationObserver {
//   external factory MutationObserver(OnMutation callback);

//   external void disconnect();
  
//   external void observe(Node target, ObserverOptions options);
  
//   external void takeRecords();
// }

// @js.JS()
// @anonymous
// class ObserverOptions {
//   external factory ObserverOptions({
//     bool? subtree,
//     bool? childList,
//     bool? attributes,
//     bool? attributeFilter,
//     bool? attributeOldValue,
//     bool? characterData,
//     bool? characterDataOldValue,
//   });
// }


// @js.JS()
// /// https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord
// class MutationRecord {
//   external NodeList get addedNodes;

//   external String? get attributeName;

//   external String? get attributeNamespace;

//   external Node? get nextSibling;

//   external String? get oldValue;

//   external Node? get previousSibling;

//   external NodeList? get removedNodes;

//   external Node get target;

//   external String get type;
// }