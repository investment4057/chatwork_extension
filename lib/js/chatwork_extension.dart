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

@JS('dataKeepStrage')
external _dataKeepStrage(myId, accessToken, clientVer);

Future dataKeepStrage(myId, accessToken, clientVer) async {
  return promiseToFuture(_dataKeepStrage(myId, accessToken, clientVer));
}

@JS('dataGetStrageMyid')
external _dataGetStrageMyid();

Future<String> dataGetStrageMyid() async {
  return promiseToFuture(_dataGetStrageMyid());
}

// @JS('returnMyid')
// external returnMyid();
@JS('returnMyid')
external String _returnMyid();

Future<String> returnMyid() async {
  return promiseToFuture<String>(_returnMyid());
}
