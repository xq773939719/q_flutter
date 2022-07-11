import 'package:flutter/material.dart';

class Cell extends StatefulWidget {
  final int index;
  final String title;
  final TextStyle style;
  final Function callback;

  const Cell({Key? key, required this.index ,required this.title, required this.style, required this.callback})
      : super(key: key);

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  bool saved = false;

  void changeState() {
    setState(() {
      saved = !saved;
      widget.callback(widget.index, saved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: widget.style,
      ),
      trailing: Icon(
        saved ? Icons.favorite : Icons.favorite_border,
        color: saved ? Colors.red : null,
      ),
      onTap: changeState,
    );
  }
}
