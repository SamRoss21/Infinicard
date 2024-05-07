import 'package:flutter/material.dart';

class TextElement extends StatelessWidget {
  final String? type;
  final String? id;
  final Color? textcolor;
  final String? text;
  final double? textsize;
  const TextElement({this.textcolor, this.text, this.textsize, this.type = "text", this.id = "text"});

factory TextElement.fromJSON(Map<String, dynamic> data){
    final size = double.parse(data['textsize']);
    final color = Color(int.parse(data['color']));
  return TextElement(
    textcolor: color,
    textsize: size
  );
}

@override 
Widget build(BuildContext context){
  return Text("hello", style: TextStyle(color: textcolor, fontSize: textsize));
}
}