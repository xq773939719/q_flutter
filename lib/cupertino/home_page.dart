import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class CupertinoHomePage extends StatefulWidget {
  final String title;

  const CupertinoHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Container(),
    );
  }
}
