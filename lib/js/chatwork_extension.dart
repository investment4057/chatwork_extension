@JS()
library chatwork_extension;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('allOpenedChat')
external _allOpenedChat(myId, accessToken, clientVer);

Future allOpenedChat(myId, accessToken, clientVer) async {
  // `promiseToFuture` メソッドでJavaScriptのPromiseをDartのFutureに変換
  return promiseToFuture(_allOpenedChat(myId, accessToken, clientVer));
}
