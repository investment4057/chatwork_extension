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
