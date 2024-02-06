import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final String type;
  final String id;
  final List<Widget> elements;

  Cards(this.type, this.id, this.elements);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(child: Column(children: [...widget.elements],)));
  }
}
//stack for layout in flutter - has you manually position stuff