import 'package:flutter/material.dart';
import 'js/chrome_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          padding: const EdgeInsets.all(10.0),
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
                        const Text('[TO]以外のメッセージを一括で既読'),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('一括既読'),
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
