import 'package:flutter/material.dart';
import 'js/chrome_api.dart';
import 'js/chatwork_extension.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

String myId = '777';
String clientVer = '';
String accessToken = '';

class _MyAppState extends State<MyApp> {
  late TextEditingController _myIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future(() async {
      print(dataGetStrageMyid().runtimeType);
      print('順0 : ' + myId);
      myId = '888';
      print('順1 : ' + myId);
      final docs = dataGetStrageMyid();
      await docs.then((value) {
        print('順2 : ' + value);
        myId = value;
      });
      print('順3 : ' + myId);

      _myIdController = TextEditingController(text: myId);
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
                // if (snapshot.hasData) {
                //   if (snapshot.data!.contains('https://www.chatwork.com')) {
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
                            // initialValue: myId,
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
                //   } else {
                //     return const Text(
                //       'Chatworkを開いてお使いください😥',
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     );
                //   }
                // } else {
                //   return const Text(
                //     'データの取得に失敗しました😥',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   );
                // }
              },
            ),
          ),
        ),
      ),
    );
  }
}
