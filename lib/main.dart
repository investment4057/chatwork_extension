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
  String accessToken = '';
  String clientVer = '';

  late TextEditingController _myIdController = TextEditingController();
  late TextEditingController _accessTokenController = TextEditingController();
  late TextEditingController _clientVerController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future(() async {
      myId = await dataGetStrageMyid() ?? '';
      accessToken = await dataGetStrageAccessToken() ?? '';
      clientVer = await dataGetStrageClientVer() ?? '';

      setState(() {
        _myIdController = TextEditingController(text: myId);
        _accessTokenController = TextEditingController(text: accessToken);
        _clientVerController = TextEditingController(text: clientVer);
      });
    });
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
                                controller: _myIdController,
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
                                controller: _accessTokenController,
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
                                controller: _clientVerController,
                                onChanged: (text) {
                                  clientVer = text;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () =>
                              dataKeepStrage(myId, accessToken, clientVer),
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
                            const Text('[TO]とピンチャット以外を一括既読'),
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
