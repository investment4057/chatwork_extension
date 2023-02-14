import 'package:chatwork_extension/js/chatwork_extension.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (() => helloWorld()),
            child: const Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
