import 'package:flutter/material.dart';
import 'js/chrome_api.dart';
import 'js/chatwork_extension.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myId = '';
  String clientVer = '';
  String accessToken = '';
  String testText = '初期値'; // テスト用

  @override
  void initState() {
    super.initState();
    testText = dataGetStrage(); // chrome.storageからのデータをreturnで反映予定
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatworker',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Chatworker',
            style: TextStyle(
              letterSpacing: 1,
            ),
          ),
          backgroundColor: const Color.fromRGBO(240, 55, 71, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: FutureBuilder(
              initialData: 'initial data',
              future: getUrl(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.contains('https://www.chatwork.com')) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('MYIDを入力'),
                            SizedBox(
                              width: 160,
                              child: TextField(
                                enabled: true,
                                decoration: InputDecoration(
                                  hintText: 'MYID',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (text) {
                                  myId = text;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ACCESS_TOKENを入力'),
                            SizedBox(
                              width: 160,
                              child: TextField(
                                enabled: true,
                                decoration: InputDecoration(
                                  hintText: 'ACCESS_TOKEN',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (text) {
                                  accessToken = text;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('CLIENT_VERを入力'),
                            SizedBox(
                              width: 160,
                              child: TextField(
                                enabled: true,
                                decoration: InputDecoration(
                                  hintText: 'CLIENT_VER',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (text) {
                                  clientVer = text;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('JSからデータを渡す'),
                            SizedBox(
                              width: 160,
                              child: TextFormField(
                                enabled: true,
                                decoration: InputDecoration(
                                  hintText: 'JSからデータ',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                initialValue: testText,
                                onChanged: (text) {
                                  testText = text;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          // onPressed: () =>
                          //     dataKeepStrage(myId, accessToken, clientVer),
                          onPressed: () {
                            // final testText = dataGetStrage();
                            print(testText);
                          },
                          child: const Text('保存する'),
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 2,
                          height: 80,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('[TO]以外を一括既読する'),
                            ElevatedButton(
                              onPressed: () =>
                                  allOpenedChat(myId, accessToken, clientVer),
                              child: const Text('一括既読'),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text(
                      'Chatworkを開いてお使いください😥',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  }
                } else {
                  return const Text(
                    'データの取得に失敗しました😥',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
