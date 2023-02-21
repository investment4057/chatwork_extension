@JS()
library chatwork_extension;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('allOpenedChat')
external _allOpenedChat(myId);

Future allOpenedChat(myId) async {
  // `promiseToFuture` メソッドでJavaScriptのPromiseをDartのFutureに変換
  return promiseToFuture(_allOpenedChat(myId));
}
