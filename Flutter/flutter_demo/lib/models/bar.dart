import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  final String type;
  final String id;
  final Color color;
  final String title;

  Bar(this.type, this.id, this.color, {this.title = ""});

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    if(widget.title == ""){
      return AppBar(backgroundColor: widget.color, title: Row(mainAxisAlignment: MainAxisAlignment.start, children:[Text("No Title Provided")]));
    }
    else{
      return AppBar(backgroundColor: widget.color, title: Row(mainAxisAlignment: MainAxisAlignment.start, children:[Text(widget.title)]));
    }
  }
}
