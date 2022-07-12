import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:q_flutter/cell.dart';

class RandomWords extends StatefulWidget {
  final Function callback;

  const RandomWords({Key? key, required this.callback}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 16);

  final Set<WordPair> _saved = <WordPair>{};

  void save(int index, bool saved) {
    var value = _suggestions[index];
    if (saved) {
      _saved.add(value);
    } else {
      _saved.remove(value);
    }
    widget.callback(_saved);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return Cell(
          index: index,
          title: _suggestions[index].asPascalCase,
          style: _biggerFont,
          callback: save,
        );
      },
    );
  }
}
