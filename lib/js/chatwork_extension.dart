@JS()
library chatwork_extension;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('allOpenedChat')
// external allOpenedChat();
external _allOpenedChat();
// external void allOpenedChat();

Future<void> allOpenedChat() async {
  // `promiseToFuture` メソッドでJavaScriptのPromiseをDartのFutureに変換
  return promiseToFuture<void>(_allOpenedChat());
}

// Test Code
@JS('testFunc')
external void testFunc(Fruits fruits);

@JS()
@anonymous
class Fruits {
  external String get name;
  external int get price;
  external factory Fruits({String name, int price});
}
