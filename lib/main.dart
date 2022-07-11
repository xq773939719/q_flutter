
import 'package:flutter/material.dart';
import 'list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter工程',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late RandomWords randomWords;

  void onRightButtonClick() {
  }

  @override
  Widget build(BuildContext context) {
    const randomWords = RandomWords();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: onRightButtonClick),
        ],
      ),
      body: const Center(
        child: randomWords,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
