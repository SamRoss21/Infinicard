import 'package:flutter/material.dart';

class TextElement extends StatefulWidget {
  final String type;
  final String id;
  final Color color;
  final String text;

  TextElement(this.type, this.id, this.color, this.text);

  @override
  _TextElementState createState() => _TextElementState();
}

class _TextElementState extends State<TextElement> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: TextStyle(color: widget.color,));
  }
}