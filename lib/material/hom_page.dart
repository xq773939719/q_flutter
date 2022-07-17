import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../widget/list.dart';

class MaterialHomePage extends StatefulWidget {
  final String title;

  const MaterialHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MaterialHomePage> createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
  late Set<WordPair> savedData;
  late RandomWords randomWords;

  void onRightButtonClick() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // 新增如下20行代码 ...
        builder: (BuildContext context) {
          const biggerFont = TextStyle(fontSize: 16);
          final Iterable<ListTile> tiles = savedData.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('保存的数据'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  void callback(Set<WordPair> data) {
    savedData = data;
  }

  @override
  Widget build(BuildContext context) {
    randomWords = RandomWords(callback: callback);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.list), onPressed: onRightButtonClick),
        ],
      ),
      body: Center(
        child: randomWords,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
