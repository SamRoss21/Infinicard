import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  final String type;
  final String id;
  final List<Widget> children;

  Group(this.type, this.id, this.children);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [...widget.children])
    );
  }
}